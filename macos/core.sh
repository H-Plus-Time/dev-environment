#!/bin/zsh
chmod a+x ~/.zshrc
PS1='$ '
source ~/.zshrc

brew install git

## nice zsh extras
git clone https://github.com/carloscuesta/materialshell.git
cp materialshell/zsh/materialshelldark.zsh-theme $HOME/.oh-my-zsh/themes/
rm -r materialshell
echo 'ZSH_THEME="materialdesigndark"' >> ~/.zshrc

## grab vim, zsh, compilers
brew install vim curl unzip wget entr zeromq4 llvm gcc

## Install rvm, rake, ruby, gem
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.zshrc
source $HOME/.rvm/scripts/rvm

## nice vim extras
brew install exuberant-ctags ack-grep
curl -L https://bit.ly/janus-bootstrap | nohup bash &

# time to install cask forcommercially licensed apps
brew update
brew tap caskroom/cask
brew install brew-cask

# java!
brew install java7
brew install java8
brew install jenv

## grab nodejs niceties
brew install nvm
nvm install node
npm install -g bower
## Careful with yarn - currently nukes bower_components :S
npm install -g yarn

## grab python niceties
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Mac-x86_64.sh -O ./miniconda3.sh
chmod +x ./miniconda3.sh
zsh ./miniconda3.sh -b -p $HOME/miniconda3
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
#Update working env with changes to .zshrc file
source ~/.zshrc
conda env update -f envs/base.yml

echo 'source `which activate.sh`' >> ~/.zshrc

## caddy
curl https://getcaddy.com | zsh

# Git extras
wget https://github.com/github/hub/releases/download/v2.2.5/hub-linux-amd64-2.2.5.tgz -O hub.tgz
tar -xvf hub.tgz && sudo zsh ./hub/install

# Golang
brew install go
mkdir $HOME/goprojects
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export GOPATH=$HOME/goprojects' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
## TODO: Install glide

# nice jvm extras
curl -s "https://get.sdkman.io" | zsh
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install maven

# set up docker - Kitematic should be sufficient.

## grab Atom, HyperTerm
brew install atom
brew install hyperterm
## Atom extras
source ~/.zshrc
apm install sync-settings

## HyperTerm extras
npm install -g hpm-cli
hpm install hyperterm-materialshell
sh ./composer-install.sh

# Cleanup
rm miniconda3.sh
rm hub.tgz
echo 'check that janus finished installing, delete nohup.out'
