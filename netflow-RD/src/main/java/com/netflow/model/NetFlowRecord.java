package com.netflow.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class NetFlowRecord implements Serializable {
    private static final long serialVersionUID = 1L;

    @JsonProperty("type")
    private String type;
    
    @JsonProperty("time_received_ns")
    private BigInteger timeReceivedNs;
    
    @JsonProperty("sequence_num")
    private long sequenceNum;
    
    @JsonProperty("sampling_rate")
    private long samplingRate;
    
    @JsonProperty("sampler_address")
    private String samplerAddress;
    
    @JsonProperty("time_flow_start_ns")
    private BigInteger timeFlowStartNs;
    
    @JsonProperty("time_flow_end_ns")
    private BigInteger timeFlowEndNs;
    
    @JsonProperty("bytes")
    private long bytes;
    
    @JsonProperty("packets")
    private long packets;
    
    @JsonProperty("src_addr")
    private String srcAddr;
    
    @JsonProperty("dst_addr")
    private String dstAddr;
    
    @JsonProperty("etype")
    private String etype;
    
    @JsonProperty("proto")
    private String proto;
    
    @JsonProperty("src_port")
    private long srcPort;
    
    @JsonProperty("dst_port")
    private long dstPort;
    
    @JsonProperty("in_if")
    private long inIf;
    
    @JsonProperty("out_if")
    private long outIf;
    
    @JsonProperty("src_mac")
    private String srcMac;
    
    @JsonProperty("dst_mac")
    private String dstMac;
    
    @JsonProperty("src_vlan")
    private long srcVlan;
    
    @JsonProperty("dst_vlan")
    private long dstVlan;
    
    @JsonProperty("vlan_id")
    private String vlanId;
    
    @JsonProperty("ip_tos")
    private long ipTos;
    
    @JsonProperty("forwarding_status")
    private long forwardingStatus;
    
    @JsonProperty("ip_ttl")
    private long ipTtl;
    
    @JsonProperty("ip_flags")
    private long ipFlags;
    
    @JsonProperty("tcp_flags")
    private long tcpFlags;
    
    @JsonProperty("icmp_type")
    private long icmpType;
    
    @JsonProperty("icmp_code")
    private long icmpCode;
    
    @JsonProperty("ipv6_flow_label")
    private long ipv6FlowLabel;
    
    @JsonProperty("fragment_id")
    private long fragmentId;
    
    @JsonProperty("fragment_offset")
    private long fragmentOffset;
    
    @JsonProperty("src_as")
    private long srcAs;
    
    @JsonProperty("dst_as")
    private long dstAs;
    
    @JsonProperty("next_hop_as")
    private long nextHopAs;
    
    @JsonProperty("next_hop")
    private String nextHop;
    
    @JsonProperty("bgp_next_hop")
    private String bgpNextHop;
    
    @JsonProperty("bgp_communities")
    private List<String> bgpCommunities;
    
    @JsonProperty("src_net")
    private String srcNet;
    
    @JsonProperty("dst_net")
    private String dstNet;

    @JsonProperty("as_path")
    private List<String> asPath;

    @JsonProperty("mpls_ttl")
    private List<Integer> mplsTtl;

    @JsonProperty("mpls_label")
    private List<Integer> mplsLabel;

    @JsonProperty("mpls_ip")
    private List<String> mplsIp;

    @JsonProperty("observation_domain_id")
    private int observationDomainId;

    @JsonProperty("observation_point_id")
    private int observationPointId;

    @JsonProperty("layer_stack")
    private List<String> layerStack;

    @JsonProperty("layer_size")
    private List<Integer> layerSize;

    @JsonProperty("ipv6_routing_header_addresses")
    private List<String> ipv6RoutingHeaderAddresses;

    @JsonProperty("ipv6_routing_header_seg_left")
    private int ipv6RoutingHeaderSegLeft;

    // Getters and Setters
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public BigInteger getTimeReceivedNs() { return timeReceivedNs; }
    public void setTimeReceivedNs(BigInteger timeReceivedNs) { this.timeReceivedNs = timeReceivedNs; }
    
    public int getSequenceNum() { return (int)sequenceNum; }
    public void setSequenceNum(int sequenceNum) { this.sequenceNum = sequenceNum; }
    
    public int getSamplingRate() { return (int)samplingRate; }
    public void setSamplingRate(int samplingRate) { this.samplingRate = samplingRate; }
    
    public String getSamplerAddress() { return samplerAddress; }
    public void setSamplerAddress(String samplerAddress) { this.samplerAddress = samplerAddress; }
    
    public BigInteger getTimeFlowStartNs() { return timeFlowStartNs; }
    public void setTimeFlowStartNs(BigInteger timeFlowStartNs) { this.timeFlowStartNs = timeFlowStartNs; }
    
    public BigInteger getTimeFlowEndNs() { return timeFlowEndNs; }
    public void setTimeFlowEndNs(BigInteger timeFlowEndNs) { this.timeFlowEndNs = timeFlowEndNs; }
    
    public long getBytes() { return bytes; }
    public void setBytes(long bytes) { this.bytes = bytes; }
    
    public long getPackets() { return packets; }
    public void setPackets(long packets) { this.packets = packets; }
    
    public String getSrcAddr() { return srcAddr; }
    public void setSrcAddr(String srcAddr) { this.srcAddr = srcAddr; }
    
    public String getDstAddr() { return dstAddr; }
    public void setDstAddr(String dstAddr) { this.dstAddr = dstAddr; }
    
    public String getEtype() { return etype; }
    public void setEtype(String etype) { this.etype = etype; }
    
    public String getProto() { return proto; }
    public void setProto(String proto) { this.proto = proto; }
    
    public int getSrcPort() { return (int)srcPort; }
    public void setSrcPort(int srcPort) { this.srcPort = srcPort; }
    
    public int getDstPort() { return (int)dstPort; }
    public void setDstPort(int dstPort) { this.dstPort = dstPort; }
    
    public int getInIf() { return (int)inIf; }
    public void setInIf(int inIf) { this.inIf = inIf; }
    
    public int getOutIf() { return (int)outIf; }
    public void setOutIf(int outIf) { this.outIf = outIf; }
    
    public String getSrcMac() { return srcMac; }
    public void setSrcMac(String srcMac) { this.srcMac = srcMac; }
    
    public String getDstMac() { return dstMac; }
    public void setDstMac(String dstMac) { this.dstMac = dstMac; }
    
    public int getSrcVlan() { return (int)srcVlan; }
    public void setSrcVlan(int srcVlan) { this.srcVlan = srcVlan; }
    
    public int getDstVlan() { return (int)dstVlan; }
    public void setDstVlan(int dstVlan) { this.dstVlan = dstVlan; }
    /* string vlanid*/
    public String getVlanId() { return vlanId; }
    public void setVlanId(String vlanId) { this.vlanId = vlanId; }
    
    public int getIpTos() { return (int)ipTos; }
    public void setIpTos(int ipTos) { this.ipTos = ipTos; }
    
    public int getForwardingStatus() { return (int)forwardingStatus; }
    public void setForwardingStatus(int forwardingStatus) { this.forwardingStatus = forwardingStatus; }
    
    public int getIpTtl() { return (int)ipTtl; }
    public void setIpTtl(int ipTtl) { this.ipTtl = ipTtl; }
    
    public int getIpFlags() { return (int)ipFlags; }
    public void setIpFlags(int ipFlags) { this.ipFlags = ipFlags; }
    
    public int getTcpFlags() { return (int)tcpFlags; }
    public void setTcpFlags(int tcpFlags) { this.tcpFlags = tcpFlags; }
    
    public int getIcmpType() { return (int)icmpType; }
    public void setIcmpType(int icmpType) { this.icmpType = icmpType; }
    
    public int getIcmpCode() { return (int)icmpCode; }
    public void setIcmpCode(int icmpCode) { this.icmpCode = icmpCode; }
    
    public int getIpv6FlowLabel() { return (int)ipv6FlowLabel; }
    public void setIpv6FlowLabel(int ipv6FlowLabel) { this.ipv6FlowLabel = ipv6FlowLabel; }
    
    public int getFragmentId() { return (int)fragmentId; }
    public void setFragmentId(int fragmentId) { this.fragmentId = fragmentId; }
    
    public int getFragmentOffset() { return (int)fragmentOffset; }
    public void setFragmentOffset(int fragmentOffset) { this.fragmentOffset = fragmentOffset; }
    
    public int getSrcAs() { return (int)srcAs; }
    public void setSrcAs(int srcAs) { this.srcAs = srcAs; }
    
    public int getDstAs() { return (int)dstAs; }
    public void setDstAs(int dstAs) { this.dstAs = dstAs; }
    
    public String getNextHop() { return nextHop; }
    public void setNextHop(String nextHop) { this.nextHop = nextHop; }
    
    public int getNextHopAs() { return (int)nextHopAs; }
    public void setNextHopAs(int nextHopAs) { this.nextHopAs = nextHopAs; }
    
    public String getBgpNextHop() { return bgpNextHop; }
    public void setBgpNextHop(String bgpNextHop) { this.bgpNextHop = bgpNextHop; }
    
    public List<String> getBgpCommunities() { return bgpCommunities; }
    public void setBgpCommunities(List<String> bgpCommunities) { this.bgpCommunities = bgpCommunities; }
    
    public String getSrcNet() { return srcNet; }
    public void setSrcNet(String srcNet) { this.srcNet = srcNet; }
    
    public String getDstNet() { return dstNet; }
    public void setDstNet(String dstNet) { this.dstNet = dstNet; }

    public List<String> getAsPath() {
        return asPath;
    }

    public void setAsPath(List<String> asPath) {
        this.asPath = asPath;
    }

    public List<Integer> getMplsTtl() {
        return mplsTtl;
    }

    public void setMplsTtl(List<Integer> mplsTtl) {
        this.mplsTtl = mplsTtl;
    }

    public List<Integer> getMplsLabel() {
        return mplsLabel;
    }

    public void setMplsLabel(List<Integer> mplsLabel) {
        this.mplsLabel = mplsLabel;
    }

    public List<String> getMplsIp() {
        return mplsIp;
    }

    public void setMplsIp(List<String> mplsIp) {
        this.mplsIp = mplsIp;
    }

    public int getObservationDomainId() {
        return observationDomainId;
    }

    public void setObservationDomainId(int observationDomainId) {
        this.observationDomainId = observationDomainId;
    }

    public int getObservationPointId() {
        return observationPointId;
    }

    public void setObservationPointId(int observationPointId) {
        this.observationPointId = observationPointId;
    }

    public List<String> getLayerStack() {
        return layerStack;
    }

    public void setLayerStack(List<String> layerStack) {
        this.layerStack = layerStack;
    }

    public List<Integer> getLayerSize() {
        return layerSize;
    }

    public void setLayerSize(List<Integer> layerSize) {
        this.layerSize = layerSize;
    }

    public List<String> getIpv6RoutingHeaderAddresses() {
        return ipv6RoutingHeaderAddresses;
    }

    public void setIpv6RoutingHeaderAddresses(List<String> ipv6RoutingHeaderAddresses) {
        this.ipv6RoutingHeaderAddresses = ipv6RoutingHeaderAddresses;
    }

    public int getIpv6RoutingHeaderSegLeft() {
        return ipv6RoutingHeaderSegLeft;
    }

    public void setIpv6RoutingHeaderSegLeft(int ipv6RoutingHeaderSegLeft) {
        this.ipv6RoutingHeaderSegLeft = ipv6RoutingHeaderSegLeft;
    }
} 