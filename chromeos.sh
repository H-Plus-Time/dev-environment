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
sudo apt-get install -y vim git curl clang unzip wget entr

## Install rvm, rake, ruby, gem
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --autolibs=enabled --ruby
source ~/.zshrc
source $HOME/.rvm/scripts/rvm

## nice vim extras
sudo apt-get -y install exuberant-ctags ack-grep
curl -L https://bit.ly/janus-bootstrap | nohup bash &

# java!
sudo apt-get install -y python-software-properties debconf-utils
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

## grab nodejs niceties
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | zsh
source $HOME/.zshrc
export NVM_DIR="/home/nicholas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
echo 'export NVM_DIR="/home/nicholas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> $HOME/.zshrc
nvm install node
npm install -g bower

## grab python niceties
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ./miniconda3.sh
chmod +x ./miniconda3.sh
zsh ./miniconda3.sh -b -p $HOME/miniconda3
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
#Update working env with changes to .zshrc file
source ~/.zshrc
conda env create -f environment.yml

echo 'source activate dev-base' >> ~/.zshrc
echo 'source `which activate.sh`' >> ~/.zshrc

## caddy
curl https://getcaddy.com | zsh

# Git extras
wget https://github.com/github/hub/releases/download/v2.2.5/hub-linux-amd64-2.2.5.tgz -O hub.tgz
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

## grab Atom, HyperTerm
wget -O atom.deb https://atom.io/download/deb && sudo dpkg -i atom.deb
sudo apt-get -fy install
wget -O hyperterm.deb https://github.com/zeit/hyperterm/releases/download/v0.7.1/hyperterm-0.7.1.deb && sudo dpkg -i hyperterm.deb
sudo apt-get -fy install

## Atom extras
source ~/.zshrc
apm install sync-settings

## HyperTerm extras
npm install -g hpm-cli
hpm install hyperterm-materialshell

# Cleanup
rm miniconda3.sh
rm hub.tgz
rm hyperterm.deb
rm atom.deb
sudo rm -r /var/cache/apt/archives/*
echo 'check that janus finished installing, delete nohup.out'
