# dockerimage-kafka

## use it! 

Use `docker-compose` please!

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
```
