#!/bin/sh

bash /opt/zookeeper/bin/zkServer.sh start

bash /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
