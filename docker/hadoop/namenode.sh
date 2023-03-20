#!/bin/bash

#creating a generic container
docker run -it -d  --hostname namenode --name namenode ubuntu
#enter on shell the container
docker exec -it namenode /bin/bash
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
#hadoop
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin

source .bashrc




