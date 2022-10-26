#!/bin/bash

# install java
apt install openjdk-8-jdk

#https://accounts.streamsets.com/archives
wget https://archives.streamsets.com/datacollector/3.22.3/tarball/activation/streamsets-datacollector-all-3.22.3.tgz
mv streamsets-datacollector /opt/stramsets

cd /opt/streamsets
bin/streamsets dc

