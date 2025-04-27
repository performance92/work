package com.netflow.sink;

import java.util.stream.Collectors;

import org.apache.flink.configuration.Configuration;
import org.apache.flink.streaming.api.functions.sink.RichSinkFunction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.netflow.model.NetFlowRecord;

import io.questdb.client.Sender;

public class QuestDBSink extends RichSinkFunction<NetFlowRecord> {

    private static final Logger LOG = LoggerFactory.getLogger(QuestDBSink.class);
    private static final String TABLE_NAME = "netflow";

    private transient Sender sender;
    private final String host;
    private final int port;

    public QuestDBSink(String host, int port) {
        this.host = host;
        this.port = port;
    }

    @Override
    public void open(Configuration parameters) throws Exception {
        sender = Sender.builder("tcp::addr=" + host + ":" + port)
                .build();
    }

    @Override
    public void invoke(NetFlowRecord record, Context context) throws Exception {
        try {
            sender.table(TABLE_NAME)
                    // Write all symbol columns first
                    .symbol("type", record.getType())
                    .symbol("sampler_address", record.getSamplerAddress())
                    .symbol("src_addr", record.getSrcAddr())
                    .symbol("dst_addr", record.getDstAddr())
                    .symbol("etype", record.getEtype())
                    .symbol("proto", record.getProto())
                    .symbol("src_mac", record.getSrcMac())
                    .symbol("dst_mac", record.getDstMac())
                    .symbol("next_hop", record.getNextHop())
                    .symbol("src_net", record.getSrcNet())
                    .symbol("dst_net", record.getDstNet())
                    .symbol("vlan_id", String.valueOf(record.getVlanId()))
                    .symbol("bgp_next_hop", record.getBgpNextHop())
                    .symbol("bgp_communities", record.getBgpCommunities() != null ? String.join(",", record.getBgpCommunities()) : "")
                    .symbol("as_path", record.getAsPath() != null ? String.join(",", record.getAsPath()) : "")
                    .symbol("mpls_ttl", record.getMplsTtl() != null ? record.getMplsTtl().stream().map(String::valueOf).collect(Collectors.joining(",")) : "")
                    .symbol("mpls_label", record.getMplsLabel() != null ? record.getMplsLabel().stream().map(String::valueOf).collect(Collectors.joining(",")) : "")
                    .symbol("mpls_ip", record.getMplsIp() != null ? String.join(",", record.getMplsIp()) : "")
                    .symbol("layer_stack", record.getLayerStack() != null ? String.join(",", record.getLayerStack()) : "")
                    .symbol("layer_size", record.getLayerSize() != null ? record.getLayerSize().stream().map(String::valueOf).collect(Collectors.joining(",")) : "")
                    .symbol("ipv6_routing_header_addresses", record.getIpv6RoutingHeaderAddresses() != null ? String.join(",", record.getIpv6RoutingHeaderAddresses()) : "")
                    // Then write timestamp columns
                    .timestampColumn("time_received", record.getTimeReceivedNs() != null ? 
                        java.time.Instant.ofEpochSecond(0, record.getTimeReceivedNs().longValue()) : null)
                    .timestampColumn("time_flow_start", record.getTimeFlowStartNs() != null ? 
                        java.time.Instant.ofEpochSecond(0, record.getTimeFlowStartNs().longValue()) : null)
                    .timestampColumn("time_flow_end", record.getTimeFlowEndNs() != null ? 
                        java.time.Instant.ofEpochSecond(0, record.getTimeFlowEndNs().longValue()) : null)
                    // Finally write long columns
                    .longColumn("sequence_num", record.getSequenceNum())
                    .longColumn("sampling_rate", record.getSamplingRate())
                    .longColumn("bytes", record.getBytes())
                    .longColumn("packets", record.getPackets())
                    .longColumn("src_port", record.getSrcPort())
                    .longColumn("dst_port", record.getDstPort())
                    .longColumn("in_if", record.getInIf())
                    .longColumn("out_if", record.getOutIf())
                    .longColumn("src_vlan", record.getSrcVlan())
                    .longColumn("dst_vlan", record.getDstVlan())
                    .longColumn("ip_tos", record.getIpTos())
                    .longColumn("forwarding_status", record.getForwardingStatus())
                    .longColumn("ip_ttl", record.getIpTtl())
                    .longColumn("ip_flags", record.getIpFlags())
                    .longColumn("tcp_flags", record.getTcpFlags())
                    .longColumn("icmp_type", record.getIcmpType())
                    .longColumn("icmp_code", record.getIcmpCode())
                    .longColumn("ipv6_flow_label", record.getIpv6FlowLabel())
                    .longColumn("fragment_id", record.getFragmentId())
                    .longColumn("fragment_offset", record.getFragmentOffset())
                    .longColumn("src_as", record.getSrcAs())
                    .longColumn("dst_as", record.getDstAs())
                    .longColumn("next_hop_as", record.getNextHopAs())
                    .longColumn("observation_domain_id", record.getObservationDomainId())
                    .longColumn("observation_point_id", record.getObservationPointId())
                    .longColumn("ipv6_routing_header_seg_left", record.getIpv6RoutingHeaderSegLeft())
                    .atNow();
        } catch (Exception e) {
            LOG.error("Error writing to QuestDB: {}", e.getMessage(), e);
            throw e;
        }
    }

    @Override
    public void close() throws Exception {
        if (sender != null) {
            sender.close();
        }
    }
}
