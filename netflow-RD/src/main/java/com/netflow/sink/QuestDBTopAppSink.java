package com.netflow.sink;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.netflow.NetFlowTopAppProcessor.TopAppResult;

import io.questdb.client.Sender;

public class QuestDBTopAppSink extends RichSinkFunction<TopAppResult> {

    private static final Logger LOG = LoggerFactory.getLogger(QuestDBTopAppSink.class);
    private static final String TABLE_NAME = "netflow_top_apps";

    private transient Sender sender;
    private final String host;
    private final int port;

    public QuestDBTopAppSink(String host, int port) {
        this.host = host;
        this.port = port;
    }

    @Override
    public void open(Configuration parameters) throws Exception {
        sender = Sender.builder("tcp::addr=" + host + ":" + port).build();
        LOG.info("QuestDBTopAppSink initialized with host={}, port={}", host, port);

        try {
            String createTableQuery = String.format(
                "CREATE TABLE IF NOT EXISTS %s (" +
                "timestamp TIMESTAMP," +
                "proto SYMBOL," +
                "dst_port LONG," +
                "total_bytes LONG," +
                "window_start TIMESTAMP," +
                "window_end TIMESTAMP" +
                ") TIMESTAMP(timestamp) PARTITION BY MONTH",
                TABLE_NAME
            );

            URL url = new URL("http://" + host + ":9000/exec?query=" +
                    URLEncoder.encode(createTableQuery, "UTF-8"));
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                LOG.info("Table {} created or already exists.", TABLE_NAME);
            } else {
                LOG.warn("Failed to create table {}. Response code: {}", TABLE_NAME, responseCode);
            }

            conn.disconnect(); // bağlantıyı kapatmayı unutma
        } catch (Exception e) {
            LOG.error("Error while creating table {}: {}", TABLE_NAME, e.getMessage(), e);
        }
    }

    @Override
    public void invoke(TopAppResult result, Context context) {
        try {
            sendToQuestDB(result);
        } catch (Exception e) {
            LOG.error("Write failed, attempting reconnect. Error: {}", e.getMessage(), e);
            try {
                if (sender != null) {
                    sender.close();
                }
            } catch (Exception closeEx) {
                LOG.warn("Error while closing sender: {}", closeEx.getMessage(), closeEx);
            }

            try {
                sender = Sender.builder("tcp::addr=" + host + ":" + port).build();
                LOG.info("Reconnected to QuestDB successfully.");
                sendToQuestDB(result); // tekrar dene
            } catch (Exception retryEx) {
                LOG.error("Retry failed. Data dropped: {}", result, retryEx);
            }
        }
    }

    private void sendToQuestDB(TopAppResult result) {
        sender.table(TABLE_NAME)
                // Write symbol columns first
                .symbol("proto", result.proto)
                // Then write timestamp columns
                .timestampColumn("timestamp", result.timestamp)
                .timestampColumn("window_start", result.windowStart)
                .timestampColumn("window_end", result.windowEnd)
                // Finally write long columns
                .longColumn("dst_port", result.dstPort)
                .longColumn("total_bytes", result.totalBytes)
                .atNow();
        
        sender.flush();
        LOG.info("Successfully wrote Top App data to QuestDB: {}", result);
    }

    @Override
    public void close() throws Exception {
        if (sender != null) {
            sender.close();
            LOG.info("Sender closed cleanly.");
        }
    }
}
