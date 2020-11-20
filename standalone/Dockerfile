FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/java:jre-8

LABEL MAINTAINER="应卓 <yingzhor@gmail.com>"

USER root:root

ENV JMXDISABLE=true
ENV ZOOKEEPER_HOME=/opt/zookeeper
ENV KAFKA_HOME=/opt/kafka
ENV PATH=$PATH:$ZOOKEEPER_HOME/bin:$KAFKA_HOME/bin
ENV KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"
ENV KAFKA_ADVERTISED_HOST="127.0.0.1"
ENV KAFKA_ADVERTISED_PORT=9092

ARG ZOOKEEPER_VERSION=3.6.2
ARG ZOOKEEPER_DOWNLOAD_LINK="https://apache.claz.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz"

ARG KAFKA_VERSION=2.6.0
ARG KAFKA_SCALA_VERSION=2.13
ARG KAFKA_DOWNLOAD_LINK="https://apache.claz.org/kafka/${KAFKA_VERSION}/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz"

RUN wget ${ZOOKEEPER_DOWNLOAD_LINK} -O /opt/zookeeper.tgz && \
    wget ${KAFKA_DOWNLOAD_LINK} -O /opt/kafka.tgz && \
    tar -zxf /opt/zookeeper.tgz -C /opt && \
    tar -zxf /opt/kafka.tgz -C /opt && \
    mv /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin /opt/zookeeper && \
    mv /opt/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka && \
    rm -rf /opt/*.tgz && \
    rm -rf /opt/*.tar.gz && \
    mkdir -p /var/data/zookeeper && \
    mkdir -p /var/data/kafka && \
    echo -n "1" > /var/data/zookeeper/myid && \
    chmod +x /bin/docker-entrypoint.sh && \
    rm -rf ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg && \
    rm -rf ${ZOOKEEPER_HOME}/bin/zkServer.sh && \
    rm -rf ${ZOOKEEPER_HOME}/docs/ && \
    find ${ZOOKEEPER_HOME} -name "*.txt" -delete && \
    find ${ZOOKEEPER_HOME} -name "*.cmd" -delete && \
    find ${ZOOKEEPER_HOME} -name "*.md" -delete && \
    rm -rf ${KAFKA_HOME}/LICENSE && \
    rm -rf ${KAFKA_HOME}/NOTICE && \
    rm -rf ${KAFKA_HOME}/site-docs && \
    rm -rf ${KAFKA_HOME}/bin/windows

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh
COPY ./shell/zk/zoo.cfg ${ZOOKEEPER_HOME}/conf/zoo.cfg
COPY ./shell/zk/zkServer.sh ${ZOOKEEPER_HOME}/bin/zkServer.sh
COPY ./shell/kafka/server.properties ${KAFKA_HOME}/config/server.properties.tmpl

RUN chmod +x ${ZOOKEEPER_HOME}/bin/zkServer.sh

EXPOSE 2181 \
    2888 \
    3888 \
    9092 \
    36437

ENTRYPOINT ["docker-entrypoint.sh"]