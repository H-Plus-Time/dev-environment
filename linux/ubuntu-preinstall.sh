sudo apt-get install salt-minion python-git -y
sudo mkdir /srv/salt
sudo cp chromeos/states/* /srv/salt
sudo cp chromeos/states/.* /srv/salt
sudo cp -r chromeos/pillar /srv/pillar

mkdir -p $HOME/goprojects/src
mkdir -p $HOME/goprojects/bin
touch $HOME/.zshrc
cat shared-nix/partial.zshrc | tee --append $HOME/.zshrc > /dev/null
cat chromeos/partial.salt_config | sudo tee --append /etc/salt/minion > /dev/null

sudo salt-call --local state.apply -l debug
