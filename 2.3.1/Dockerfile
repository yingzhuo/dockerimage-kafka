FROM openjdk:8u232-jre-stretch

MAINTAINER 应卓 yingzhor@gmail.com

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN \
    wget "https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz" -O /opt/zookeeper-3.4.14.tar.gz && \
    wget "http://mirror.bit.edu.cn/apache/kafka/2.3.1/kafka_2.12-2.3.1.tgz" -O /opt/kafka_2.12-2.3.1.tgz && \
    tar -zxf /opt/kafka_2.12-2.3.1.tgz -C /opt && \
    tar -zxf /opt/zookeeper-3.4.14.tar.gz -C /opt && \
    ln -sf /opt/zookeeper-3.4.14/ /opt/zookeeper && \
    ln -sf /opt/kafka_2.12-2.3.1/ /opt/kafka && \
    rm -rf /opt/kafka_2.12-2.3.1.tgz && \
    rm -rf /opt/zookeeper-3.4.14.tar.gz && \
    mkdir -p /var/zookeeper && \
    mkdir -p /var/kafka-logs && \
    chmod +x /bin/docker-entrypoint.sh

COPY ./config/zoo.cfg /opt/zookeeper/conf/zoo.cfg

COPY ./config/server.properties /opt/kafka/config/server.properties

ENV \
    KAFKA_HOME=/opt/kafka \
    KAFKA_VERSION=2.3.1 \
    KAFKA_SCALA_VERSION=2.12.x \
    ZOOKEEPER_HOME=/opt/zookeeper \
    ZOOKEEPER_VERSION=3.4.14

EXPOSE \
        2181 \
        9092

CMD ["docker-entrypoint.sh"]
