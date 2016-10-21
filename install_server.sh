#!/usr/bin/env bash

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

# Kafka configuration
KAFKA_ZOOKEEPER=localhost:2181
KAFKA_TOPIC=record-invoke-trace

./mvnw -DskipTests --also-make -pl zipkin-server clean install
