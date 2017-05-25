sudo apt-get install salt-minion python-git -y
sudo mkdir /srv/salt
sudo cp -L linux/states/* /srv/salt
sudo cp linux/states/.condarc /srv/salt

mkdir -p $HOME/goprojects/src
mkdir -p $HOME/goprojects/bin
touch $HOME/.zshrc
cat shared-nix/partial.zshrc | tee --append $HOME/.zshrc > /dev/null
cat linux/partial.salt_config | sudo tee /etc/salt/minion > /dev/null

sudo salt-call --local state.apply -l debug
