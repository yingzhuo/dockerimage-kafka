#!/bin/sh

set -e

docktool --quiet test --env="KAFKA_ADVERTISED_PORT"

docktool --quiet filegen -t="/opt/server.properties.tmpl" -o="/opt/kafka/config/server.properties"

bash /opt/zookeeper/bin/zkServer.sh start

bash /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
