sudo apt-get install salt-minion -y
sudo mkdir /srv/salt
sudo cp chromeos/states/* /srv/salt
echo 'file_client: local\n' | sudo tee --append /etc/salt/minion > /dev/null
sudo salt-call --local state.apply

git clone https://github.com/zplug/zplug.git $HOME/.zplug
