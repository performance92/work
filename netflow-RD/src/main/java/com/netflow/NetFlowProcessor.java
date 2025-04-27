package com.netflow;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.netflow.model.NetFlowRecord;
import com.netflow.sink.QuestDBSink;

public class NetFlowProcessor {
    private static final Logger LOG = LoggerFactory.getLogger(NetFlowProcessor.class);
    private static final String KAFKA_BROKERS = "kafka:9092";
    private static final String KAFKA_TOPIC = "flows-messages";
    private static final String QUESTDB_HOST = "questdb";
    private static final int QUESTDB_PORT = 9009;

    public static void main(String[] args) throws Exception {
        // Create Flink execution environment
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // Create Kafka source
        KafkaSource<String> source = KafkaSource.<String>builder()
                .setBootstrapServers(KAFKA_BROKERS)
                .setTopics(KAFKA_TOPIC)
                .setGroupId("netflow-processor")
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

        // Add QuestDB sink
        netflowStream.addSink(new QuestDBSink(QUESTDB_HOST, QUESTDB_PORT));

        // Execute the job
        env.execute("NetFlow Processor");
    }
} 