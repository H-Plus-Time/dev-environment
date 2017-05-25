#!/bin/zsh
PS1='$ '
source $HOME/.zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install node

wget -O hub.tgz https://github.com/github/hub/releases/download/v2.3.0-pre9/hub-linux-amd64-2.3.0-pre9.tgz
tar -xf hub.tgz && sudo mv hub/bin/hub /usr/local/bin
rm hub.tgz && rm -r hub

git clone https://github.com/zplug/zplug $HOME/.zplug

curl https://glide.sh/get | sh
npm install -g yarn
yarn global add bower polymer-cli hpm-cli gulp-cli babel-cli

wget -O hyper.deb https://hyper-updates.now.sh/download/linux_deb
sudo dpkg -i hyper.deb
rm hyper.deb
sudo snap install --classic vscode
