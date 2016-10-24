#!/usr/bin/env bash

# Zipkin configuration
QUERY_PORT=9411

JAR_FILE=$1

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

$JAVA_HOME/bin/java -XX:InitialHeapSize=512M -XX:MaxHeapSize=512M -jar $JAR_FILE
