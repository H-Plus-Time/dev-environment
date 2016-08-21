#!/bin/bash

#Snapshot management - optional, requires filesystem support (btrfs, zfs, thin-provisioned ext4)
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/filesystems:snapper/CentOS_7/filesystems:snapper.repo
sudo yum update -y
sudo yum install -y snapper

cd ~/dev_environment

sudo yum install -y git zsh vim  ack ctags
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.rpm > jdk-8u65-linux-x64.rpm
rpm -ivh jdk-8u65-linux-x64.rpm
rm jdk-8u65-linux-x64.rpm