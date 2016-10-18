#!/usr/bin/env bash

# use ElasticSearch as Storage
export STORAGE_TYPE=elasticsearch
export ES_CLUSTER=local-cluster
export ES_HOSTS=localhost

JAR_FILE=$1

JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

$JAVA_HOME/bin/java -jar $JAR_FILE