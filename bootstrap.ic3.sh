#!/bin/bash
wget https://raw.githubusercontent.com/jugglingcats/loadgen/master/loadgen.ic3.properties -O loadgen.properties
wget https://raw.githubusercontent.com/jugglingcats/loadgen/master/evolok-ic3-loadgen-3.0.0-SNAPSHOT.jar -O loadgen.jar

apt-get update
apt-get -y -q install python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update

echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

apt-get -y -q install oracle-java7-installer

echo "metrics.node=loadgen-`hostname`" >> loadgen.properties
echo "54.72.15.220 pmongo1" >> /etc/hosts
echo "54.77.183.46 pmongo2" >> /etc/hosts

java -jar loadgen.jar -Dad.loadgen.autostart=true > loadgen.log 2>&1
