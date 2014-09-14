#!/bin/bash
wget https://raw.githubusercontent.com/jugglingcats/loadgen/master/loadgen.properties
wget https://raw.githubusercontent.com/jugglingcats/loadgen/master/evolok-ad3-loadgen-3.4-SNAPSHOT.jar

apt-get update
apt-get -y -q install python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update

echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

apt-get -y -q install oracle-java7-installer

echo "ad.node=loadgen-`hostname`" >> loadgen.properties
echo "54.72.15.220 pmongo" >> /etc/hosts

java -jar evolok-ad3-loadgen-3.4-SNAPSHOT.jar -Dad.loadgen.autostart=true > loadgen.log 2>&1
