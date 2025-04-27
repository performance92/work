# NetFlow Processing System

This project processes NetFlow data using Apache Flink and stores results in QuestDB.

## Components

- **NetFlow Processor**: Processes raw NetFlow data and stores it in QuestDB
- **NetFlow P95 Processor**: Calculates P95 values for bytes per source-destination pair and stores results in QuestDB

## Architecture

1. NetFlow data is sent to Kafka topic `flows-messages`
2. Two Flink jobs process the data:
   - NetFlow Processor: Stores all fields
   - NetFlow P95 Processor: Calculates P95 values for bytes per (src_addr, dst_addr, dst_port)

## Setup

1. Start the services:
```bash
docker-compose up -d
```

2. Wait for services to start:
```bash
./wait-for-services.sh
```

3. Start Flink jobs:
```bash
./start-flink-jobs.sh
```

## Data Flow

1. NetFlow data → Kafka (`flows-messages`)
2. Flink jobs process the data
3. Results stored in QuestDB:
   - `netflow` table: All fields
   - `netflow_p95` table: P95 calculations

## Prerequisites

- Java 11 or higher
- Maven 3.8.1 or higher
- Docker and Docker Compose
- Apache Kafka
- QuestDB
- Apache Flink

## Dependencies

The project uses the following main dependencies:

- Apache Flink 1.17.2
- Kafka 3.2.3
- QuestDB 8.3.0
- Jackson Databind 2.15.2
- SLF4J 1.7.36
- Logback 1.2.11

## Project Structure

```
netflow-quest/
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── netflow/
│                   ├── NetFlowProcessor.java
│                   ├── model/
│                   │   └── NetFlowRecord.java
│                   └── sink/
│                       └── QuestDBSink.java
├── pom.xml
└── README.md
```

## Building the Project

To build the project:

```bash
mvn clean package
```

This will create a JAR file at `target/netflow-processor-1.0-SNAPSHOT.jar`.

## Deployment

1. Copy the JAR to the Flink jobmanager container:

```bash
docker cp target/netflow-processor-1.0-SNAPSHOT.jar flink-jobmanager:/opt/flink/netflow-processor-1.0-SNAPSHOT.jar
```

2. Run the Flink job:

```bash
docker exec -it flink-jobmanager flink run /opt/flink/netflow-processor-1.0-SNAPSHOT.jar
```
## test
## Querying Data

DROP TABLE IF EXISTS netflow;
CREATE TABLE netflow (
    type SYMBOL,
    sampler_address SYMBOL,
    src_addr SYMBOL,
    dst_addr SYMBOL,
    etype SYMBOL,
    proto SYMBOL,
    src_mac SYMBOL,
    dst_mac SYMBOL,
    next_hop SYMBOL,
    src_net SYMBOL,
    dst_net SYMBOL,
    vlan_id SYMBOL,
    bgp_next_hop SYMBOL,
    bgp_communities SYMBOL,
    as_path SYMBOL,
    mpls_ttl SYMBOL,
    mpls_label SYMBOL,
    mpls_ip SYMBOL,
    layer_stack SYMBOL,
    layer_size SYMBOL,
    ipv6_routing_header_addresses SYMBOL,
    time_received TIMESTAMP,
    time_flow_start TIMESTAMP,
    time_flow_end TIMESTAMP,
    sequence_num LONG,
    sampling_rate LONG,
    bytes LONG,
    packets LONG,
    src_port LONG,
    dst_port LONG,
    in_if LONG,
    out_if LONG,
    src_vlan LONG,
    dst_vlan LONG,
    ip_tos LONG,
    forwarding_status LONG,
    ip_ttl LONG,
    ip_flags LONG,
    tcp_flags LONG,
    icmp_type LONG,
    icmp_code LONG,
    ipv6_flow_label LONG,
    fragment_id LONG,
    fragment_offset LONG,
    src_as LONG,
    dst_as LONG,
    next_hop_as LONG,
    observation_domain_id LONG,
    observation_point_id LONG,
    ipv6_routing_header_seg_left LONG
) TIMESTAMP(time_received) PARTITION BY MONTH;

# Create Table CURL Command
curl -G --data-urlencode \
"query=CREATE TABLE netflow (
    type SYMBOL,
    sampler_address SYMBOL,
    src_addr SYMBOL,
    dst_addr SYMBOL,
    etype SYMBOL,
    proto SYMBOL,
    src_mac SYMBOL,
    dst_mac SYMBOL,
    next_hop SYMBOL,
    src_net SYMBOL,
    dst_net SYMBOL,
    vlan_id SYMBOL,
    bgp_next_hop SYMBOL,
    bgp_communities SYMBOL,
    as_path SYMBOL,
    mpls_ttl SYMBOL,
    mpls_label SYMBOL,
    mpls_ip SYMBOL,
    layer_stack SYMBOL,
    layer_size SYMBOL,
    ipv6_routing_header_addresses SYMBOL,
    time_received TIMESTAMP,
    time_flow_start TIMESTAMP,
    time_flow_end TIMESTAMP,
    sequence_num LONG,
    sampling_rate LONG,
    bytes LONG,
    packets LONG,
    src_port LONG,
    dst_port LONG,
    in_if LONG,
    out_if LONG,
    src_vlan LONG,
    dst_vlan LONG,
    ip_tos LONG,
    forwarding_status LONG,
    ip_ttl LONG,
    ip_flags LONG,
    tcp_flags LONG,
    icmp_type LONG,
    icmp_code LONG,
    ipv6_flow_label LONG,
    fragment_id LONG,
    fragment_offset LONG,
    src_as LONG,
    dst_as LONG,
    next_hop_as LONG,
    observation_domain_id LONG,
    observation_point_id LONG,
    ipv6_routing_header_seg_left LONG
) TIMESTAMP(time_received) PARTITION BY MONTH;
) TIMES" \
http://localhost:9000/exec


You can query the data in QuestDB using the following curl commands:

```bash
# Get all records
curl.exe -H "Accept: application/json" "http://localhost:9000/exec?query=SELECT%20*%20FROM%20netflow"

# Get specific records
curl.exe "http://localhost:9000/exec?query=SELECT%20*%20FROM%20netflow"
```

## Git Operations

To initialize and push the project to Git:


## Configuration

The project uses the following default configurations:

- Kafka:
  - Bootstrap servers: kafka:9092
  - Topic: flows-messages
  - Group ID: netflow-processor

- QuestDB:
  - Host: questdb
  - Port: 9009

## Troubleshooting

If you encounter the following error:
```
Failed to close release connections with type org.apache.kafka.common.network.Selector
```

This is typically due to version mismatches between Flink and Kafka. Ensure you're using compatible versions as specified in the dependencies section.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 