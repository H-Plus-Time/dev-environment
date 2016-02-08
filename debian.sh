#!/bin/bash
sudo apt-get install -y git zsh libzmq3-dev ack ctags vim sakura

sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

curl -L https://atom.io/download/deb | dpkg --install

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/filesystems:/snapper/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/snapper.list"
sudo apt-get update
sudo apt-get install snapper
