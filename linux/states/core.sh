#!/bin/zsh
PS1='$ '
source $HOME/.zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install node

go get github.com/github/hub
git clone https://github.com/zplug/zplug $HOME/.zplug

curl https://glide.sh/get | sh
npm install -g yarn
yarn global add bower polymer-cli hpm-cli gulp-cli babel-cli

wget -O hyper.deb https://hyper-updates.now.sh/download/linux_deb
sudo dpkg -i hyper.deb
rm hyper.deb
sudo snap install --classic vscode
