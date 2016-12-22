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
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O code.deb
sudo apt-get install -fy code.deb
