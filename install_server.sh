#!/usr/bin/env bash

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home

./mvnw -DskipTests --also-make -pl zipkin-server clean install
