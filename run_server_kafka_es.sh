#!/usr/bin/env bash

# Zipkin configuration
QUERY_PORT=9411

# Use elasticsearch as storage
export STORAGE_TYPE=elasticsearch
export ES_CLUSTER=local-cluster
export ES_HOSTS=localhost

# Disable SCRIBE
export SCRIBE_ENABLED=false

# Kafka configuration
export KAFKA_ZOOKEEPER=localhost:2181/local-kafka
export KAFKA_TOPIC=record-invoke-trace

JAR_FILE=$1

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

$JAVA_HOME/bin/java -XX:InitialHeapSize=512M -XX:MaxHeapSize=512M -jar $JAR_FILE
