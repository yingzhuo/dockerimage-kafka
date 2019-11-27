FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/java:8-jre

MAINTAINER 应卓 yingzhor@gmail.com

ENV \
    KAFKA_HOME=/opt/kafka \
    KAFKA_VERSION=2.3.1 \
    KAFKA_SCALA_VERSION=2.12 \
    KAFKA_BROKER_ID=0 \
    KAFKA_ADVERTISED_PORT=9092 \
    KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181

ARG DOWNLOAD_LINK="https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/${KAFKA_VERSION}/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tgz"
ARG TGZ="/opt/kafka_${KAFKA_SCALA_VERSION}-${KAFKA_VERSION}.tar.gz"

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

COPY ./config/server.properties.tmpl /opt/server.properties.tmpl

RUN \
    wget "${DOWNLOAD_LINK}" -O ${TGZ} && \
    tar -zxf ${TGZ} -C /opt && \
    mv /opt/kafka_2.12-2.3.1/ ${KAFKA_HOME} && \
    rm -rf ${TGZ} && \
    rm -rf ${KAFKA_HOME}/LICENSE \
            ${KAFKA_HOME}/NOTICE \
            ${KAFKA_HOME}/site-docs \
            ${KAFKA_HOME}/bin/windows && \
    find ${KAFKA_HOME} -name "*.asc" -delete

EXPOSE 9092

VOLUME /var/kafka-logs

CMD ["bash", "/bin/docker-entrypoint.sh"]