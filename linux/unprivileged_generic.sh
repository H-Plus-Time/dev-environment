#!/bin/bash

#NB: for space-constrained systems (Chromebooks), execute this where you are going to install it.

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz > jdk_x64.tar.gz

tar -xvf jdk_x64.tar.gz 

#Create a link a la "ln -s /absolute/path/to/jdk_x64 $HOME/jdk"
#Then add the jdk/bin folder to your PATH
echo export PATH=$PATH:$HOME/jdk/bin > ~.bashrc
#and create the JAVA_HOME env variable
echo export JAVA_HOME=$HOME/jdk > ~.bashrc