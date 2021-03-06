#!/bin/bash

set -e

mkdir -p /var/kafka-logs

docktool --quiet test --env="KAFKA_ADVERTISED_HOST_NAME" --env="KAFKA_ADVERTISED_PORT"
docktool --quiet filegen -t="/opt/server.properties.tmpl" -o="/opt/kafka/config/server.properties"
docktool --quiet wait -w "$KAFKA_ZOOKEEPER_CONNECT"

bash "${KAFKA_HOME}/bin/kafka-server-start.sh" "${KAFKA_HOME}/config/server.properties"