#!/bin/bash

yum install -y epel-release

cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/filesystems:snapper/CentOS_7/filesystems:snapper.repo
yum install -y git zsh vim snapper ack ctags zeromq zeromq-devel cmake

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.rpm > jdk-8u65-linux-x64.rpm
rpm -ivh jdk-8u65-linux-x64.rpm

wget https://atom.io/download/rpm -O atom.rpm
