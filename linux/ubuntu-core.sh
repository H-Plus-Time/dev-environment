#!/bin/zsh
cwd=$(pwd)
chmod a+x ~/.zshrc
PS1='$ '
source ~/.zshrc

# VSCode install
wget -O code.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i code.deb
sudo apt-get install -fy
rm code.deb

# Git extras
function hub_arch {
    case $(arch) in
        aarch64 )
            echo 'arm64';;
        x86_64 )
            echo 'amd64';;
        x86 )
            echo '386';;
    esac
}
wget -O $HOME/tmp/hub.tgz https://github.com/github/hub/releases/download/v2.3.0-pre9/hub-linux-$(hub_arch)-2.3.0-pre9.tgz
tar -xvf $HOME/tmp/hub.tgz && sudo zsh ./hub/install

# Golang
if [ $(arch) == 'aarch64' ]
then
    echo 'no go1.8 for you :-('
    # fetch and build golang1.4 bootstrap
    # wget https://storage.googleapis.com/golang/go1.8.src.tar.gz -O $HOME/tmp/go.tar.gz
    # cd $HOME/tmp && tar -xf go.tar.gz && cd go/src && ./all.bash && cd $cwd
else
    wget https://storage.googleapis.com/golang/go1.8.linux-$(hub_arch).tar.gz -O $HOME/tmp/go.tar.gz
    sudo tar -C /usr/local -xvf $HOME/tmp/go.tar.gz
fi
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo 'export GOPATH=$HOME/goprojects' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc

wget -O $HOME/tmp/hyperterm.deb https://hyper-updates.now.sh/download/linux_deb && sudo dpkg -i $HOME/tmp/hyperterm.deb
sudo apt-get -fy install

## HyperTerm extras
yarn global add hpm-cli@1.4.0
hpm install hyper-snazzy

# Cleanup
rm hub.tgz
sudo rm -r /var/cache/apt/archives/*
