package com.netflow.sink;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.netflow.NetFlowP95Processor.P95Result;

import io.questdb.client.Sender;

public class QuestDBP95Sink extends RichSinkFunction<P95Result> {

    private static final Logger LOG = LoggerFactory.getLogger(QuestDBP95Sink.class);
    private static final String TABLE_NAME = "netflow_p95";

    private transient Sender sender;
    private final String host;
    private final int port;

    public QuestDBP95Sink(String host, int port) {
        this.host = host;
        this.port = port;
    }

    @Override
    public void open(Configuration parameters) throws Exception {
        sender = Sender.builder("tcp::addr=" + host + ":" + port)
                .build();
        LOG.info("QuestDBP95Sink initialized with host={}, port={}", host, port);

        // Create table if not exists using HTTP API
        try {
            String createTableQuery = String.format(
                "CREATE TABLE IF NOT EXISTS %s (" +
                "src_addr SYMBOL," +
                "dst_addr SYMBOL," +
                "dst_port LONG," +
                "p95_bytes DOUBLE," +
                "p95_packets DOUBLE," +
                "window_start TIMESTAMP," +
                "window_end TIMESTAMP" +
                ") TIMESTAMP(window_start) PARTITION BY MONTH",
                TABLE_NAME
            );

            java.net.URL url = new java.net.URL("http://" + host + ":9000/exec?query=" + 
                java.net.URLEncoder.encode(createTableQuery, "UTF-8"));
            java.net.HttpURLConnection conn = (java.net.HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                LOG.info("Table {} created successfully", TABLE_NAME);
            } else {
                LOG.warn("Failed to create table {}. Response code: {}", TABLE_NAME, responseCode);
            }
        } catch (java.net.MalformedURLException | java.io.UnsupportedEncodingException e) {
            LOG.warn("Table {} might already exist or creation failed: {}", TABLE_NAME, e.getMessage());
        }
    }

    @Override
    public void invoke(P95Result result, Context context) throws Exception {
        try {
            sender.table(TABLE_NAME)
                .symbol("src_addr", result.srcAddr)
                .symbol("dst_addr", result.dstAddr)
                .longColumn("dst_port", result.dstPort)
                .doubleColumn("p95_bytes", result.p95Bytes)
                .doubleColumn("p95_packets", result.p95Packets)
                .timestampColumn("window_start", result.windowStart)
                .timestampColumn("window_end", result.windowEnd)
                .atNow();
            sender.flush();
            LOG.info("Successfully wrote P95 data to QuestDB: {}", result);
        } catch (Exception e) {
            LOG.error("Error writing P95 data to QuestDB: {}", result, e);
            // Bağlantıyı yeniden kurmayı dene
            try {
                sender = Sender.builder("tcp::addr=" + host + ":" + port).build();
                LOG.info("Reconnected to QuestDB successfully");
                
                // Yeniden bağlandıktan sonra veriyi tekrar yazmayı dene
                sender.table(TABLE_NAME)
                    .symbol("src_addr", result.srcAddr)
                    .symbol("dst_addr", result.dstAddr)
                    .longColumn("dst_port", result.dstPort)
                    .doubleColumn("p95_bytes", result.p95Bytes)
                    .doubleColumn("p95_packets", result.p95Packets)
                    .timestampColumn("window_start", result.windowStart)
                    .timestampColumn("window_end", result.windowEnd)
                    .atNow();
                sender.flush();
                LOG.info("Successfully wrote P95 data to QuestDB after reconnection: {}", result);
            } catch (Exception reconnEx) {
                LOG.error("Failed to reconnect to QuestDB", reconnEx);
            }
        }
    }

    @Override
    public void close() throws Exception {
        if (sender != null) {
            sender.close();
        }
    }
} 