#!/bin/bash


sudo apt-get install -y libzmq3-dev ack ctags

#Barebones development
sudo apt-get install -y git vim wget curl

#Preferred shell environments
sudo apt-get install -y sakura zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Java install - consider carefully on space-constrained systems (requires ~350MB).
#For installation on external media, see unprivileged_generic.sh
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer



#Snapshot management - optional, requires a supporting filesystem (btrfs, zfs, lvm thin-provisioned ext4)
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/filesystems:/snapper/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/snapper.list"
sudo apt-get update
sudo apt-get install snapper
