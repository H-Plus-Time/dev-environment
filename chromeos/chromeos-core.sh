## grab Atom, HyperTerm
wget -O atom.deb https://atom.io/download/deb && sudo dpkg -i atom.deb
sudo apt-get -fy install
rm atom.deb
## Atom extras
source ~/.zshrc
apm install sync-settings
