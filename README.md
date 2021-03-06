# dockerimage-kafka

**警告**: ⚠️ 本项目并没有经过严格测试，不可用于生产环境。

### 单节点

```yaml
version: "3.9"

services:
  zookeeper:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.8"
    container_name: "kafka-zk"
    restart: "always"

  kafka:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/kafka:2.3.1"
    container_name: "kafka"
    restart: "always"
    links:
    - "zookeeper:zookeeper"
    ports:
    - "9092:9092"
    volumes:
    - "${PWD}/data/:/var/kafka-logs/"
    environment:
    - "KAFKA_BROKER_ID=0"
    - "KAFKA_ADVERTISED_HOST_NAME=10.211.55.2"
    - "KAFKA_ADVERTISED_PORT=9092"
    - "KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181"
```

### 集群

```yaml
version: "3.9"

services:
  zookeeper1:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.8"
    container_name: "zookeeper1"
    restart: "always"
    hostname: "zookeeper1"
    networks:
    - "kafka-cluster-network"
    ports:
    - "2181:2181"
    volumes:
    - "${PWD}/data/zookeeper1/:/data/"
    environment:
    - "ZOOKEEPER_MYID=1"
    - "ZOOKEEPER_SERVERS=server.1=zookeeper1:2888:3888,server.2=zookeeper2:2888:3888,server.3=zookeeper3:2888:3888"

  zookeeper2:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.8"
    container_name: "zookeeper2"
    restart: "always"
    hostname: "zookeeper2"
    networks:
    - "kafka-cluster-network"
    ports:
    - "2182:2181"
    volumes:
    - "${PWD}/data/zookeeper2/:/data/"
    environment:
    - "ZOOKEEPER_MYID=2"
    - "ZOOKEEPER_SERVERS=server.1=zookeeper1:2888:3888,server.2=zookeeper2:2888:3888,server.3=zookeeper3:2888:3888"

  zookeeper3:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.8"
    container_name: "zookeeper3"
    restart: "always"
    hostname: "zookeeper3"
    networks:
    - "kafka-cluster-network"
    ports:
    - "2183:2181"
    volumes:
    - "${PWD}/data/zookeeper3/:/data/"
    environment:
    - "ZOOKEEPER_MYID=3"
    - "ZOOKEEPER_SERVERS=server.1=zookeeper1:2888:3888,server.2=zookeeper2:2888:3888,server.3=zookeeper3:2888:3888"

  kafka1:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/kafka:2.3.1"
    container_name: "kafka1"
    restart: "always"
    hostname: "kafka1"
    networks:
    - "kafka-cluster-network"
    ports:
    - "9092:9092"
    volumes:
    - "${PWD}/data/kafka1/:/var/kafka-logs/"
    environment:
    - "KAFKA_BROKER_ID=1"
    - "KAFKA_ADVERTISED_HOST_NAME=10.211.55.2"
    - "KAFKA_ADVERTISED_PORT=9092"
    - "KAFKA_ZOOKEEPER_CONNECT=zookeeper1:2181,zookeeper2:2181,zookeeper3:2181"

  kafka2:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/kafka:2.3.1"
    container_name: "kafka2"
    restart: "always"
    hostname: "kafka2"
    networks:
    - "kafka-cluster-network"
    ports:
    - "9093:9092"
    volumes:
    - "${PWD}/data/kafka2/:/var/kafka-logs/"
    environment:
    - "KAFKA_BROKER_ID=2"
    - "KAFKA_ADVERTISED_HOST_NAME=10.211.55.2"
    - "KAFKA_ADVERTISED_PORT=9093"
    - "KAFKA_ZOOKEEPER_CONNECT=zookeeper1:2181,zookeeper2:2181,zookeeper3:2181"

  kafka3:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/kafka:2.3.1"
    container_name: "kafka3"
    restart: "always"
    hostname: "kafka3"
    networks:
    - "kafka-cluster-network"
    ports:
    - "9094:9092"
    volumes:
    - "${PWD}/data/kafka3/:/var/kafka-logs/"
    environment:
    - "KAFKA_BROKER_ID=3"
    - "KAFKA_ADVERTISED_HOST_NAME=10.211.55.2"
    - "KAFKA_ADVERTISED_PORT=9094"
    - "KAFKA_ZOOKEEPER_CONNECT=zookeeper1:2181,zookeeper2:2181,zookeeper3:2181"

networks:
  kafka-cluster-network:
    driver: bridge
```

### 参考

* [dockerimage-zookeeper](https://github.com/yingzhuo/dockerimage-zookeeper)
