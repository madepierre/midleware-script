#!/bin/bash

#Author: Madepou
#Date: 10/27/2022
## Description: sonarqube install on centos 7
## please run this as user vagrant
user_name='whoami'
if [ $user_name != vagrant ];
then
echo "must be run as user vagrant !!!!
exit 1
fi

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
cd /opt
sudo yum install wget unzip -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64 
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
./sonar.sh start

echo "Installation done successfull please get the ip and access your sonarqube on the browser"