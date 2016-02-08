#!/bin/bash
echo 'Initializing bootstrap script'

python -m bootstrap.py

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

nvm use v5.5.0

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash -s stable --ruby

sudo gem install rake
sudo gem install giternal

curl -L https://bit.ly/janus-bootstrap | bash

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh
chmod +x miniconda3.sh
bash ~/miniconda.sh -b -p $HOME/miniconda3
export PATH="$HOME/miniconda3/bin:$PATH"

source ~/.bashrc

# conda install --file required_packages.pak
pip install -r requirements.txt

curl -s http://get.sdkman.io | bash

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
