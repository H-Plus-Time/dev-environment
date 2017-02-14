#!/bin/bash
echo 'run this last'

## Install rvm, rake, ruby, gem
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source $HOME/.zshrc
source $HOME/.rvm/scripts/rvm

## nice vim extras
curl -L https://bit.ly/janus-bootstrap | sh

curl https://getcaddy.com | sh

curl https://glide.sh/get | sh

# nice jvm extras
curl -s "https://get.sdkman.io" | sh
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install maven

# sudo apt-get install -y ghc cabal-install haskell-stack
# cabal update
# stack install github-backup
# cd $HOME
# mkdir Projects && cd Projects
# github-backup H-Plus-Time
