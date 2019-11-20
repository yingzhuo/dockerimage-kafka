#!/bin/sh

set -e

docktool filegen -t="/opt/server.properties.template" -o="/opt/kafka/config/server.properties"

bash /opt/zookeeper/bin/zkServer.sh start

bash /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
