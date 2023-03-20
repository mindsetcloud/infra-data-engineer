#!/bin/bash

#creating a generic container
docker run -it -d  --hostname hdpmaster --name hdpmaster ubuntu
#enter on shell the container
docker exec -it hdpmaster /bin/bash
#update and upgrade container
apt update 
apt upgrade
#installing tools
apt install vim wget sudo iputils-ping python3 rsync arp-scan net-tools
ln -s /usr/bin/python3 /usr/bin/python
#create a default user and add sudo group
useradd hdfsuser
passwd hdfsuser
usermod -aG sudo hdfsuser
echo "hdfsuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "sudo service ssh start" >> ~/.bashrc
#install java-8
apt install openjdk-8-jdk
#download hadoop hdfs https://hadoop.apache.org/releases.html
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz
#descompacting and move to opt folder
tar -xvf hadoop-3.3.4-src.tar.gz
mv hadoop-3.3.4-src /opt/hadoop
chown -R hdfs:hdfs /opt/hadoop
#install openssh
sudo su - hdfsuser
apt install openssh-server openssh-clients openssh-libs
ssh-keygen -t rsa -P ""
cat .ssh/id_rsa.pub > .ssh/authorized_keys
#copiar authorized_keys para as demais do cluster
#add enviroment on .bashrc
vim .bashrc
#workers users
export HDFS_NAMENODE_USER=hdfsuser
export HDFS_DATANODE_USER=hdfsuser
export HDFS_SECONDARYNAMENODE_USER=hdfsuser
export YARN_RESOURCEMANAGER_USER=hdfsuser
export YARN_NODEMANAGER_USER=hdfsuser
#java_home
export JAVA_HOME=/lib/jvm/java-8-openjdk-arm64
#hadoop_home
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
#execute source .bashrc
source .bashrc
#add routes on /etc/hosts
echo "192.168.35.27   hdpmaster" >> /etc/hosts
echo "192.168.35.28   datanode-01" >> /etc/hosts
echo "192.168.35.29   datanode-02" >> /etc/hosts
#edit in /opt/hadoop
wget core-site.xml
cat core-site.xml > /opt/hadoop/etc/hadoop/core-site.xml
wget hadoop-env.sh
cat hadoop-env.sh > /opt/hadoop/etc/hadoop/hadoop-env.sh
wget hdfs-site.xml
cat hdfs-site.xml > /opt/hadoop/etc/hadoop/hdfs-site.xml
echo "datanode-01" > /opt/hadoop/etc/hadoop/workers
echo "datanode-02" >> /opt/hadoop/etc/hadoop/workers
#commit container to datanode
docker commit hdpmaster msc/datanode
docker run -it -d --net postgres_default --ip 192.168.35.28 --name datanode-01 --hostname datanode-01 --user hdfsuser --restart=always msc/datanode
docker run -it -d --net postgres_default --ip 192.168.35.29 --name datanode-02 --hostname datanode-02 --user hdfsuser --restart=always msc/datanode
docker commit hdpmaster msc/namenode
docker run -it -d --net postgres_default --ip 192.168.35.27 --name hdpmaster --hostname hdpmaster --restart=always -p 9870:9870 -p 50030:50030 -p 8020:8020  msc/namenode









