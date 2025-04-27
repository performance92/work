package com.netflow;

import java.time.Instant;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.api.common.state.ValueState;
import org.apache.flink.api.common.state.ValueStateDescriptor;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.functions.KeyedProcessFunction;
import org.apache.flink.util.Collector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.netflow.model.NetFlowRecord;
import com.netflow.sink.QuestDBP95Sink;
import com.tdunning.math.stats.TDigest;

public class NetFlowP95Processor {
    private static final Logger LOG = LoggerFactory.getLogger(NetFlowP95Processor.class);
    private static final String KAFKA_BROKERS = "kafka:9092";
    private static final String KAFKA_TOPIC = "flows-messages";
    private static final String QUESTDB_HOST = "questdb";
    private static final int QUESTDB_PORT = 9009;
    private static final int WINDOW_SIZE_MINUTES = 5;

    public static class P95Result {
        public String srcAddr;
        public String dstAddr;
        public long dstPort;
        public double p95Bytes;
        public double p95Packets;
        public Instant windowStart;
        public Instant windowEnd;

        public P95Result(String srcAddr, String dstAddr, long dstPort, double p95Bytes, double p95Packets, Instant windowStart, Instant windowEnd) {
            this.srcAddr = srcAddr;
            this.dstAddr = dstAddr;
            this.dstPort = dstPort;
            this.p95Bytes = p95Bytes;
            this.p95Packets = p95Packets;
            this.windowStart = windowStart;
            this.windowEnd = windowEnd;
        }
    }

    public static class TDigestProcessFunction extends KeyedProcessFunction<String, NetFlowRecord, P95Result> {
        private transient ValueState<TDigest> tDigestState;
        private transient ValueState<TDigest> tDigestPacketsState;
        private transient ValueState<Long> windowStartState;

        @Override
        public void open(Configuration parameters) throws Exception {
            ValueStateDescriptor<TDigest> tDigestDescriptor = new ValueStateDescriptor<>(
                "tDigest",
                TypeInformation.of(TDigest.class)
            );
            tDigestState = getRuntimeContext().getState(tDigestDescriptor);

            ValueStateDescriptor<TDigest> tDigestPacketsDescriptor = new ValueStateDescriptor<>(
                "tDigestPackets",
                TypeInformation.of(TDigest.class)
            );
            tDigestPacketsState = getRuntimeContext().getState(tDigestPacketsDescriptor);

            ValueStateDescriptor<Long> windowStartDescriptor = new ValueStateDescriptor<>(
                "windowStart",
                TypeInformation.of(Long.class)
            );
            windowStartState = getRuntimeContext().getState(windowStartDescriptor);
            LOG.info("TDigestProcessFunction initialized");
        }

        @Override
        public void processElement(NetFlowRecord record, Context ctx, Collector<P95Result> out) throws Exception {
            LOG.debug("Processing record: src={}, dst={}, port={}, bytes={}, packets={}", 
                record.getSrcAddr(), record.getDstAddr(), record.getDstPort(), record.getBytes(), record.getPackets());

            TDigest tDigest = tDigestState.value();
            TDigest tDigestPackets = tDigestPacketsState.value();
            
            if (tDigest == null) {
                tDigest = TDigest.createMergingDigest(100);
                tDigestState.update(tDigest);
                LOG.debug("Created new TDigest instance for bytes");
            }
            
            if (tDigestPackets == null) {
                tDigestPackets = TDigest.createMergingDigest(100);
                tDigestPacketsState.update(tDigestPackets);
                LOG.debug("Created new TDigest instance for packets");
            }

            long currentWindowStart = ctx.timestamp() - (ctx.timestamp() % (WINDOW_SIZE_MINUTES * 60 * 1000));
            Long windowStart = windowStartState.value();

            if (windowStart == null || currentWindowStart > windowStart) {
                if (windowStart != null) {
                    double p95Bytes = tDigest.quantile(0.95);
                    double p95Packets = tDigestPackets.quantile(0.95);
                    LOG.info("Emitting p95 result: src={}, dst={}, port={}, p95_bytes={}, p95_packets={}", 
                        ctx.getCurrentKey().split("_")[0],
                        ctx.getCurrentKey().split("_")[1],
                        ctx.getCurrentKey().split("_")[2],
                        p95Bytes,
                        p95Packets);
                    
                    out.collect(new P95Result(
                        ctx.getCurrentKey().split("_")[0],
                        ctx.getCurrentKey().split("_")[1],
                        Long.parseLong(ctx.getCurrentKey().split("_")[2]),
                        p95Bytes,
                        p95Packets,
                        Instant.ofEpochMilli(windowStart),
                        Instant.ofEpochMilli(currentWindowStart)
                    ));
                }
                // Reset for new window
                tDigest = TDigest.createMergingDigest(100);
                tDigestPackets = TDigest.createMergingDigest(100);
                tDigestState.update(tDigest);
                tDigestPacketsState.update(tDigestPackets);
                windowStartState.update(currentWindowStart);
                LOG.debug("Reset TDigest for new window starting at {}", currentWindowStart);
            }

            tDigest.add(record.getBytes());
            tDigestPackets.add(record.getPackets());
            tDigestState.update(tDigest);
            tDigestPacketsState.update(tDigestPackets);
        }
    }

    public static void main(String[] args) throws Exception {
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // Create Kafka source
        KafkaSource<String> source = KafkaSource.<String>builder()
                .setBootstrapServers(KAFKA_BROKERS)
                .setTopics(KAFKA_TOPIC)
                .setGroupId("netflow-p95-processor")
                .setStartingOffsets(OffsetsInitializer.earliest())
                .setValueOnlyDeserializer(new SimpleStringSchema())
                .build();

        // Create data stream from Kafka
        DataStream<String> kafkaStream = env.fromSource(
                source,
                WatermarkStrategy.noWatermarks(),
                "Kafka Source"
        );

        // Parse JSON to NetFlowRecord
        ObjectMapper objectMapper = new ObjectMapper();
        DataStream<NetFlowRecord> netflowStream = kafkaStream.map(value -> {
            try {
                return objectMapper.readValue(value, NetFlowRecord.class);
            } catch (com.fasterxml.jackson.core.JsonProcessingException e) {
                LOG.error("Error parsing JSON: {}. Raw JSON: {}", e.getMessage(), value, e);
                return null;
            }
        }).filter(record -> record != null);

        // Calculate p95 for each src_addr, dst_addr, dst_port combination
        DataStream<P95Result> p95Stream = netflowStream
            .keyBy(record -> record.getSrcAddr() + "_" + record.getDstAddr() + "_" + record.getDstPort())
            .process(new TDigestProcessFunction());

        // Add QuestDB sink for p95 results
        p95Stream.addSink(new QuestDBP95Sink(QUESTDB_HOST, QUESTDB_PORT));

        // Execute the job
        env.execute("NetFlow P95 Processor");
    }
} 