FROM openjdk:8u191-jdk-alpine3.8

LABEL maintainer="Giovani Grifante <grifante@gmail.com>"

ENV PATH="${PATH}:/opt/arthas/"
RUN apk add --no-cache tini

ARG ARTHAS_VERSION="3.0.5"

RUN wget -qO /tmp/arthas.zip "https://repo1.maven.org/maven2/com/taobao/arthas/arthas-packaging/${ARTHAS_VERSION}/arthas-packaging-${ARTHAS_VERSION}-bin.zip" && \
    mkdir -p /opt/arthas && \
    unzip /tmp/arthas.zip -d /opt/arthas && \
    rm /tmp/arthas.zip && \
    echo "java -jar /opt/arthas/arthas-boot.jar" > /opt/arthas/arthas.sh && \
    chmod +x /opt/arthas/arthas.sh 