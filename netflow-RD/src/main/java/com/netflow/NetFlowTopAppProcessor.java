package com.netflow;

import java.time.Duration;
import java.time.Instant;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.common.functions.AggregateFunction;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.functions.windowing.ProcessWindowFunction;
import org.apache.flink.streaming.api.windowing.assigners.TumblingEventTimeWindows;
import org.apache.flink.streaming.api.windowing.time.Time;
import org.apache.flink.streaming.api.windowing.windows.TimeWindow;
import org.apache.flink.util.Collector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.netflow.model.NetFlowRecord;
import com.netflow.sink.QuestDBTopAppSink;

public class NetFlowTopAppProcessor {
    private static final Logger LOG = LoggerFactory.getLogger(NetFlowTopAppProcessor.class);
    private static final String KAFKA_BROKERS = "kafka:9092";
    private static final String KAFKA_TOPIC = "flows-messages";
    private static final String QUESTDB_HOST = "questdb";
    private static final int QUESTDB_PORT = 9009;
    private static final int WINDOW_SIZE_MINUTES = 5;

    public static class TopAppResult {
        public Instant timestamp;
        public String proto;
        public long dstPort;
        public long totalBytes;
        public Instant windowStart;
        public Instant windowEnd;

        public TopAppResult(Instant timestamp, String proto, long dstPort, long totalBytes, Instant windowStart, Instant windowEnd) {
            this.timestamp = timestamp;
            this.proto = proto;
            this.dstPort = dstPort;
            this.totalBytes = totalBytes;
            this.windowStart = windowStart;
            this.windowEnd = windowEnd;
            LOG.debug("Created TopAppResult: proto={}, port={}, total_bytes={}, window_start={}, window_end={}", 
                proto, dstPort, totalBytes, windowStart, windowEnd);
        }
    }

    public static class BytesSumAggregator implements AggregateFunction<NetFlowRecord, Long, Long> {
        @Override
        public Long createAccumulator() {
            return 0L;
        }

        @Override
        public Long add(NetFlowRecord record, Long accumulator) {
            return accumulator + record.getBytes();
        }

        @Override
        public Long getResult(Long accumulator) {
            return accumulator;
        }

        @Override
        public Long merge(Long a, Long b) {
            return a + b;
        }
    }

    public static void main(String[] args) throws Exception {
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // Create Kafka source
        KafkaSource<String> source = KafkaSource.<String>builder()
                .setBootstrapServers(KAFKA_BROKERS)
                .setTopics(KAFKA_TOPIC)
                .setGroupId("netflow-top-app-processor")
                .setStartingOffsets(OffsetsInitializer.earliest())
                .setValueOnlyDeserializer(new SimpleStringSchema())
                .build();

        // Create data stream from Kafka
        DataStream<String> kafkaStream = env.fromSource(
                source,
                WatermarkStrategy.<String>forBoundedOutOfOrderness(Duration.ofSeconds(5))
                    .withTimestampAssigner((event, timestamp) -> System.currentTimeMillis()),
                "Kafka Source"
        );

        // Parse JSON to NetFlowRecord
        ObjectMapper objectMapper = new ObjectMapper();
        DataStream<NetFlowRecord> netflowStream = kafkaStream.map(value -> {
            try {
                NetFlowRecord record = objectMapper.readValue(value, NetFlowRecord.class);
                LOG.info("Parsed NetFlowRecord: proto={}, dst_port={}, bytes={}", 
                    record.getProto(), record.getDstPort(), record.getBytes());
                return record;
            } catch (com.fasterxml.jackson.core.JsonProcessingException e) {
                LOG.error("Error parsing JSON: {}. Raw JSON: {}", e.getMessage(), value, e);
                return null;
            }
        }).filter(record -> record != null);

        // Calculate total bytes for each proto + dst_port combination
        DataStream<TopAppResult> topAppStream = netflowStream
            .keyBy(record -> record.getProto() + "_" + record.getDstPort())
            .window(TumblingEventTimeWindows.of(Time.minutes(WINDOW_SIZE_MINUTES)))
            .process(new ProcessWindowFunction<NetFlowRecord, TopAppResult, String, TimeWindow>() {
                @Override
                public void process(String key, Context context, Iterable<NetFlowRecord> elements, Collector<TopAppResult> out) {
                    long totalBytes = 0L;
                    int recordCount = 0;
                    for (NetFlowRecord record : elements) {
                        totalBytes += record.getBytes();
                        recordCount++;
                    }
                    
                    String[] keyParts = key.split("_");
                    TopAppResult result = new TopAppResult(
                        Instant.ofEpochMilli(context.window().getStart()),
                        keyParts[0],
                        Long.parseLong(keyParts[1]),
                        totalBytes,
                        Instant.ofEpochMilli(context.window().getStart()),
                        Instant.ofEpochMilli(context.window().getEnd())
                    );
                    LOG.info("Processing window for key={}, total_bytes={}, record_count={}, window_start={}, window_end={}", 
                        key, totalBytes, recordCount, result.windowStart, result.windowEnd);
                    out.collect(result);
                }
            });

        // Add QuestDB sink for top app results
        topAppStream.addSink(new QuestDBTopAppSink(QUESTDB_HOST, QUESTDB_PORT));

        // Execute the job
        env.execute("NetFlow Top Application Processor");
    }
} 