#!/bin/zsh

## grab vim, zsh, compilers
sudo apt-get install -y vim git curl clang unzip

## Install rvm, rake, ruby, gem
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash
source ~/.zshrc
source $HOME/.rvm/scripts/rvm

## nice vim extras
sudo apt-get -y install exuberant-ctags ack-grep
curl -L https://bit.ly/janus-bootstrap | bash

## nice zsh extras
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/carloscuesta/materialshell.git
cp materialshell/zsh/materialshelldark.zsh-theme $HOME/.oh-my-zsh/themes/
echo 'ZSH_THEME="materialdesigndark"' >> ~/.zshrc

## java!
sudo apt-get install -y python-software-properties debconf-utils
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

## nice jvm extras
curl -s http://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install mvn latest

## grab nodejs niceties
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
source ~/.zshrc
nvm install node
npm install -g bower

## grab Atom, HyperTerm
curl -o- https://atom.io/download/deb | sudo dpkg --install
sudo apt-get -fy install
curl -o- https://github.com/zeit/hyperterm/releases/download/v0.7.1/hyperterm-0.7.1.deb | sudo dpkg --install
sudo apt-get -fy install

## Atom extras
apm install sync-settings atom-beautify atom-polymer linter

## HyperTerm extras
npm install -g hpm-cli
hpm install hyperterm-materialshell

## grab python niceties
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh
chmod +x miniconda3.sh
bash ~/miniconda.sh -b -p $HOME/miniconda3
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
#Update working env with changes to .bashrc file
source ~/.zshrc

#Install any python packages you may want.
conda install --file required_packages.pak || echo No conda package list provided
python setup.py install

## caddy
curl https://getcaddy.com | bash
