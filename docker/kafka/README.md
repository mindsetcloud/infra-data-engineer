## kafka

### install

```  sh
sudo apt update
sudo apt install default-jre
```

``` sh
wget https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz
```

``` sh
sudo chown -R hadoop:hadoop /opt/kafka
```

``` sh
vim .bash_profile
# kafka
export KAFKA_HOME=/opt/kafka
export PATH=$PATH:$KAFKA_HOME/bin
```

``` sh
source .bash_profile
```

### init
```sh
bin/zookepper-server-start.sh config/zookepper.properties
bin/kafka-server-start.sh config/server.properties
```

### create topic
``` sh
bin/kafka-topics.sh --create --topic topic1 --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1

```

### producer
``` sh
bin/kafka-console-producer.sh --broker-list --bootstrap-server localhost:9092 --topic topic1

```

### consumer
``` sh
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic1 --from-beginning

```
