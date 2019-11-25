# dockerimage-kafka

单节点`kafka`，请使用`docker-compose`启动之。

**注意:** 请务必为容器配置`KAFKA_ADVERTISED_HOST_NAME`环境变量。

```yaml
version: "3.7"

services:
  zookeeper:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.4.14"
    container_name: "kafka-zk"
    restart: "always"
    volumes:
    - "${PWD}/data/zookeeper/:/var/zookeeper"

  kafka:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/kafka:2.3.1"
    container_name: "kafka"
    restart: "always"
    links:
    - "zookeeper:zookeeper"
    ports:
    - "9092:9092"
    volumes:
    - "${PWD}/data/kafka-logs/:/var/kafka-logs/"
    environment:
    - "KAFKA_BROKER_ID=0"
    - "KAFKA_ADVERTISED_HOST_NAME=10.211.55.2"
    - "KAFKA_ADVERTISED_PORT=9092"
    - "KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181"
```
