#!/bin/bash

# Wait for Kafka to be ready
echo "Waiting for Kafka to be ready..."
while ! nc -z localhost 9092; do
  sleep 1
done

# Create topics
echo "Creating topics..."
kafka-topics --create --topic flows-messages --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

echo "Topics created successfully!" 