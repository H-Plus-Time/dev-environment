#!/bin/zsh
# sudo apt-get -y install snapd

. $HOME/.zshrc
# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable google-chrome-beta google-chrome-unstable

# sudo snap install docker darktable-kyrofa vlc telegram-latest
conda env update -f envs/full.yml

sudo add-apt-repository ppa:saltstack/salt
sudo apt-get update
sudo apt-get -y install salt-minion

# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get -y install spotify-client

sudo apt-get -y install arc-theme unity-tweak-tool

sudo apt-get -y install redshift redshift-gtk

sudo curl -sSL https://get.docker.com/ | sh


wget -O Etcher.ziphttps://resin-production-downloads.s3.amazonaws.com/etcher/1.0.0-beta.17/Etcher-1.0.0-beta.17-linux-x64.zip
unzip Etcher.zip && yes | ./Etcher-linux-x64.AppImage install
rm Etcher.zip Etcher-linux-x64.AppImage

wget -O slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-2.3.4-amd64.deb
sudo dpkg -i slack.deb
sudo apt-get install -fy
rm slack.deb

sudo add-apt-repository ppa:peterlevi/ppa
sudo apt-get update
sudo apt-get install -y variety

sudo apt-get install -y cups-pdf virtualbox parallel openssh-server
sudo apt-get install -y djvu2pdf htop iotop

sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ yakkety main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.0-preview2.1-003177
docker pull microsoft/dotnet:latest
