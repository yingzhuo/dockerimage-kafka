# dockerimage-kafka

单节点`kafka`，请使用`docker-compose`启动之。

**注意:** 请务必为容器配置`KAFKA_ADVERTISED_HOST_NAME`环境变量。

```yaml
version: "3.7"

services:
  kafka:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/kafka:2.3.1"
    container_name: "kafka"
    restart: "always"
    ports:
    - "9092:9092"
    volumes:
    - "${PWD}/data/zookeeper/:/var/zookeeper"
    - "${PWD}/data/kafka-logs/:/var/kafka-logs/"
    environment:
    - "KAFKA_ADVERTISED_HOST_NAME=192.168.99.114"
    - "KAFKA_ADVERTISED_PORT=9092"
```
