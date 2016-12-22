sudo apt-get -y install snapd
sudo snap install docker atom-cwayne darktable-kyrofa vlc telegram-latest
conda env update -f envs/full.yml
## Atom extras
source ~/.zshrc
apm install sync-settings

# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client

sudo apt-get install arc-theme unity-tweak-tool

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable google-chrome-beta google-chrome-unstable

sudo apt-get install redshift
wget -O code.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i code.deb
sudo apt-get install -fy
rm code.deb

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

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update

sudo apt-cache search nvidia
# install latest version here
wget -O cuda.run https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda_8.0.44_linux-run
sudoo sh cuda.run
