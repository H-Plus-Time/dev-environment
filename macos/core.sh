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
brew install vim curl wget entr zeromq llvm gcc

# time to install cask forcommercially licensed apps
brew update
brew tap caskroom/cask
brew tap caskroom/versions

# java!
brew cask install java7
brew cask install java
brew install jenv

## grab nodejs niceties
brew install nvm
nvm install node
npm install -g bower yarn

## grab python niceties
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ./miniconda3.sh
chmod +x ./miniconda3.sh
zsh ./miniconda3.sh -b -p $HOME/miniconda3
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
#Update working env with changes to .zshrc file
source ~/.zshrc
conda env update -f envs/base.yml

echo 'source `which activate.sh`' >> ~/.zshrc

# Git extras
brew install hub

# Golang
brew install go
mkdir $HOME/goprojects
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export GOPATH=$HOME/goprojects' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc

# set up docker - Kitematic should be sufficient.
brew cask install alfred kitematic docker-toolbox

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

sh shared-nix/install.sh

# Cleanup
rm miniconda3.sh
rm hub.tgz
