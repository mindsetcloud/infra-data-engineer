## kafka

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
