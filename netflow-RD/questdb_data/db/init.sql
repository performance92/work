DROP TABLE IF EXISTS netflow_data;

CREATE TABLE IF NOT EXISTS netflow_data (
    type STRING,
    time_received TIMESTAMP,
    time_flow_start STRING,
    time_flow_end STRING,
    sequence_num LONG,
    sampling_rate INTEGER,
    sampler_address STRING,
    src_addr STRING,
    dst_addr STRING,
    etype STRING,
    proto STRING,
    src_port INTEGER,
    dst_port INTEGER,
    in_if INTEGER,
    out_if INTEGER,
    src_mac STRING,
    dst_mac STRING,
    src_vlan INTEGER,
    dst_vlan INTEGER,
    vlan_id INTEGER,
    bytes LONG,
    packets LONG
) TIMESTAMP(time_received) PARTITION BY DAY; 