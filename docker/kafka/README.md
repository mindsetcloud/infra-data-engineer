[![N|Solid](https://raw.githubusercontent.com/mindsetcloud/infra-data-engineer/main/static/img/mindsetcloud.png)](https://mindsetcloud.net)

# KAFKA
## _Kafka broker and zookeeper_

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://nodesource.com/products/nsolid)

### _install on ubuntu:_
[ shell ](https://github.com/mindsetcloud/infra-data-engineer/blob/main/docker/kafka/install.sh) - shell

### _install within docker compose:_
[ docker-compose ](https://github.com/mindsetcloud/infra-data-engineer/blob/main/docker/kafka/kafka.yml) - docker-compose

### _install within dockerfile:_
[ dockerfile ](https://github.com/mindsetcloud/infra-data-engineer/blob/main/docker/kafka/Dockerfile) - dockerfile

## kafka single cluster

### init zookeeper
```sh
bin/zookeeper-server-start.sh config/zookeeper.properties
```
### init kafka
```sh
bin/kafka-server-start.sh config/server.properties
```
### create topic
```sh
bin/kafka-topics.sh --create --topic topic1 --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1
```
### producer
```sh
bin/kafka-console-producer.sh --topic topic1 --bootstrap-server localhost:9092
```
### consumer
```sh
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic1 --from-beginning
```

## kafka multi cluster

``` sh
bin/zookeeper-server-start.sh config/zookeeper.properties
```
### create n files server_n(s).properties
```sh
cp config/server.properties conf/server_n.properties
```



