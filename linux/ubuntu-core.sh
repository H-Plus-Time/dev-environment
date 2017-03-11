#!/bin/zsh
cwd=$(pwd)
chmod a+x ~/.zshrc
PS1='$ '
source ~/.zshrc

## grab vim, zsh, compilers
yes | sudo pacapt -S vim git curl clang unzip wget entr libzmq3-dev

## nice vim extras
yes | sudo pacapt -S exuberant-ctags ack-grep

# java!
yes | sudo pacapt -S python-software-properties debconf-utils
yes | sudo pacapt -S software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
yes | sudo pacapt -S oracle-java8-installer

## grab nodejs niceties
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | zsh
source $HOME/.zshrc
export NVM_DIR="/home/nicholas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
if [ $(arch) == 'aarch64']
then
    yes | sudo pacapt -S weston
    nvm install node
else
    nvm install node
fi
echo 'export NVM_DIR="/home/nicholas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> $HOME/.zshrc

npm install -g bower yarn

function translate_arch {
    if [ $(arch) == 'aarch64' ]
    then
        echo 'armv7l'
    else
        echo $(arch)
    fi
}
## grab python niceties
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-$(translate_arch).sh -O ./miniconda3.sh
chmod +x ./miniconda3.sh
zsh ./miniconda3.sh -b -p $HOME/miniconda3
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
rm miniconda3.sh
export PATH="$HOME/miniconda3/bin:$PATH"
if [ $(arch) == 'aarch64' ]
then
    # rpi required to satisfy dependencies
    cp ./.condarc $HOME
    sed -ie "s#'armv6l', 'armv7l'#'armv6l', 'armv7l', 'aarch64'#g" \
        $HOME/miniconda3/lib/python3.4/site-packages/conda/config.py
    sed -ie "s#arch_name = machine()#arch_name = machine()\n    if arch_name == 'aarch64':\n        arch_name = 'armv7l'#g" \
        $HOME/miniconda3/lib/python3.4/site-packages/conda/config.py
    conda install python=3.6 -y
    replace_text="'linux' and m in non_x86_linux_machines:"
    s4="    "
    s8="        "
    # Correct arch_name
    text="${s4}${s8}if m == 'aarch64':"
    text_p2="${s8}${s8}return armv7l"
    sed -ie "s#${replace_text}#${replace_text}\n${text}\n${text_p2}#g" \
        $HOME/miniconda3/lib/python3.4/site-packages/conda/config.py

    # Always access m via the modified arch_name func
    replace_text="${s4}${s8}return 'linux-%s' % m"
    text="return 'linux-%s' % self.arch_name"
    sed -ie "s#${replace_text}#${s8}${s4}${text}#g" \
        $HOME/miniconda3/lib/python3.4/site-packages/conda/config.py
    # Add aarch64 to the list of non_x86_linux_machines arches
    sed -ie "s#non_x86_linux_machines = {#non_x86_linux_machines = {\n${s4}'aarch64',#g" \
        $HOME/miniconda3/lib/python3.4/site-packages/conda/config.py
fi

#Update working env with changes to .zshrc file
source ~/.zshrc
# conda env update -f envs/base.yml
# conda env create -f envs/py27.yml

echo 'source `which activate.sh`' >> ~/.zshrc

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
    # fetch and build golang1.4 bootstrap
    yes | sudo pacapt -S gccgo
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

# Global npm utilities
yarn global add babel-cli polymer-cli gulp-cli

## HyperTerm extras
yarn global add hpm-cli@1.4.0
hpm install hyper-snazzy

# Cleanup
rm hub.tgz
sudo rm -r /var/cache/apt/archives/*
