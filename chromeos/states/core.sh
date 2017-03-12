#!/bin/zsh
PS1='$ '
source $HOME/.zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

function nvm_get_arch() { echo 'armv7l'; }

nvm install node

go get github.com/github/hub
git clone https://github.com/zplug/zplug $HOME/.zplug

wget -O glide.tar.gz https://github.com/Masterminds/glide/releases/download/v0.12.3/glide-v0.12.3-linux-armv7.tar.gz
tar -xf glide.tar.gz
npm install -g yarn
yarn global add bower polymer-cli hpm-cli gulp-cli babel-cli

git clone https://github.com/zeit/hyper --depth=1 $HOME/hyper

git clone --depth=1 https://github.com/microsoft/vscode $HOME/vscode
$HOME/vscode/scripts/npm.sh install --arch=armhf
cd $HOME/vscode && gulp vscode-linux-arm-deb
