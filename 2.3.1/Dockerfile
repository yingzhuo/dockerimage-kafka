FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/java:8-jre

MAINTAINER 应卓 yingzhor@gmail.com

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN \
    wget "https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.3.1/kafka_2.12-2.3.1.tgz" -O /opt/kafka_2.12-2.3.1.tar.gz && \
    tar -zxf /opt/kafka_2.12-2.3.1.tar.gz -C /opt && \
    mv /opt/kafka_2.12-2.3.1/ /opt/kafka && \
    rm -rf /opt/kafka_2.12-2.3.1.tar.gz && \
    mkdir -p /var/kafka-logs && \
    chmod +x /bin/docker-entrypoint.sh && \
    rm -rf /opt/kafka/LICENSE /opt/kafka/NOTICE /opt/kafka/site-docs /opt/kafka/bin/windows && \
    find /opt/kafka -name "*.asc" -delete

COPY ./config/server.properties.tmpl /opt/server.properties.tmpl

ENV \
    KAFKA_HOME=/opt/kafka \
    KAFKA_VERSION=2.3.1 \
    KAFKA_SCALA_VERSION=2.12.x \
    ZOOKEEPER_HOME=/opt/zookeeper \
    ZOOKEEPER_VERSION=3.4.14 \

    KAFKA_BROKER_ID=0 \
    KAFKA_ADVERTISED_PORT=9092 \
    KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181

EXPOSE 9092

VOLUME /var/kafka-logs

CMD ["docker-entrypoint.sh"]