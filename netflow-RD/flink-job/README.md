# Flink Jobs

This directory contains the compiled JAR files for the Flink jobs:

1. `netflow-processor.jar`: Processes all NetFlow data and stores it in QuestDB
2. `netflow-p95-processor.jar`: Calculates P95 values for bytes per source-destination pair

Note: JAR files are not tracked in Git. You need to build them using:

```bash
mvn clean package
``` 