#!/usr/bin/env bash

# need java8
JAVA8_HOME=

# Zipkin configuration
QUERY_PORT=9411

# Use elasticsearch as storage
export STORAGE_TYPE=elasticsearch
export ES_CLUSTER=lef-trace-test-cluster
export ES_HOSTS=localhost

# Disable SCRIBE
export SCRIBE_ENABLED=false

# Kafka configuration
export KAFKA_ZOOKEEPER=localhost:2181
export KAFKA_TOPIC=record-invoke-trace
export KAFKA_STREAMS=1                  # Count of consumer threads consuming the topic
export KAFKA_MAX_MESSAGE_SIZE=1048576   # Maximum size of a message containing spans in bytes

BASEDIR=$(cd `dirname $0`; pwd)

ZIPKIN_HOME=$BASEDIR/..

LIB_HOME=$ZIPKIN_HOME/lib

JAR_FILE=$LIB_HOME/zipkin-server-exec.jar

PID_FILE=$ZIPKIN_HOME/zipkin.pid

# JAVA_OPTS
JAVA_OPTS="-server -Duser.dir=$BASEDIR"
JAVA_OPTS="${JAVA_OPTS} -Xms2G -Xmx2G"
JAVA_OPTS="${JAVA_OPTS} -XX:+UseConcMarkSweepGC -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintGCDetails -XX:HeapDumpPath=$LOG_PATH -Xloggc:$LOG_PATH/gc.log"

function start()
{
    $JAVA8_HOME/bin/java $JAVA_OPTS -jar $JAR_FILE $1 > /dev/null 2>&1 &
    echo $! > $PID_FILE
}

function stop()
{
    pid=`cat $PID_FILE`
    echo "kill $pid ..."
    kill $pid
    rm -f $PID_FILE
}

args=($@)

case "$1" in

    'start')
        start
        ;;

    'stop')
        stop
        ;;

    'restart')
        stop
        start
        ;;

    'help')
        help $2
        ;;
    *)
        echo "Usage: $0 { start | stop | restart | help }"
        exit 1
        ;;
esac