#!/bin/bash
sudo yum install -y git zsh vim snapper ack ctags

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.rpm > jdk-8u65-linux-x64.rpm
rpm -ivh jdk-8u65-linux-x64.rpm

curl -L https://atom.io/download/rpm | rpm -ivh
