FROM ubuntu:latest

LABEL maintainer="mindsetcloud"

RUN apt-get update -y;

RUN apt install default-jre ; \
    apt install wget ; \
    wget https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz ; \
    
ENV KAFKA_VERSION=$kafka_version \
    SCALA_VERSION=$scala_version \
   
    
ENV  KAFKA_HOME=/opt/kafka \
     PATH=${PATH}:${KAFKA_HOME}/bin
