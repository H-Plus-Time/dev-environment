#!/bin/zsh
chmod a+x ~/.zshrc
PS1='$ '
source ~/.zshrc

## nice zsh extras
git clone https://github.com/carloscuesta/materialshell.git
cp materialshell/zsh/materialshelldark.zsh-theme $HOME/.oh-my-zsh/themes/
rm -r materialshell
echo 'ZSH_THEME="materialdesigndark"' >> ~/.zshrc

## grab vim, zsh, compilers
yes | sudo pacapt -S vim git curl clang unzip wget entr libzmq3-dev

## Install rvm, rake, ruby, gem
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.zshrc
source $HOME/.rvm/scripts/rvm

## nice vim extras
yes | sudo pacapt -S exuberant-ctags ack-grep
curl -L https://bit.ly/janus-bootstrap | bash

# java!
yes | sudo pacapt -S python-software-properties debconf-utils
yes | sudo pacapt -S software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
yes | pacapt -S oracle-java8-installer

## grab nodejs niceties
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | zsh
source $HOME/.zshrc
export NVM_DIR="/home/nicholas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
echo 'export NVM_DIR="/home/nicholas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> $HOME/.zshrc
nvm install node
npm install -g bower yarn

## grab python niceties
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda3.sh
chmod +x ./miniconda3.sh
zsh ./miniconda3.sh -b -p $HOME/miniconda3
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
rm miniconda3.sh
#Update working env with changes to .zshrc file
source ~/.zshrc
conda env update -f envs/base.yml
conda env create -f envs/py27.yml

echo 'source `which activate.sh`' >> ~/.zshrc

## caddy
curl https://getcaddy.com | zsh

# Git extras
wget https://github.com/github/hub/releases/download/v2.2.9/hub-linux-amd64-2.2.9.tgz -O hub.tgz
tar -xvf hub.tgz && sudo zsh ./hub/install

# Golang
wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz -O go.tar.gz
sudo tar -C /usr/local -xvf go.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export GOPATH=$HOME/goprojects' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc

# nice jvm extras
curl -s "https://get.sdkman.io" | zsh
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install maven

wget -O hyperterm.deb https://hyper-updates.now.sh/download/linux_deb && sudo dpkg -i hyperterm.deb
sudo apt-get -fy install

## HyperTerm extras
yarn global add hpm-cli
hpm install hyperterm-materialshell
# sh ./composer-install.sh

# Cleanup
rm hub.tgz
rm hyperterm.deb
sudo rm -r /var/cache/apt/archives/*
echo 'check that janus finished installing, delete nohup.out'
