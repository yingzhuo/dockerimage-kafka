#!/bin/bash

set -e

# 启动zk
echo "[[[ ZOOKEEPER ]]]"
bash "${ZOOKEEPER_HOME}/bin/zkServer.sh" start

# 等待zk启动完成再尝试启动kafka
docktool --quiet wait -w localhost:2181

# 启动kafka
echo "[[[ KAFKA ]]]"
docktool --quiet test --env="KAFKA_ADVERTISED_HOST" --env="KAFKA_ADVERTISED_PORT"
docktool --quiet filegen -t="${KAFKA_HOME}/config/server.properties.tmpl" -o="${KAFKA_HOME}/config/server.properties"
rm -rf "${KAFKA_HOME}/config/server.properties.tmpl"
bash "${KAFKA_HOME}/bin/kafka-server-start.sh" "${KAFKA_HOME}/config/server.properties"

docktool -q sleep