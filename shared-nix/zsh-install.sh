sudo wget -O /usr/local/bin/pacapt \
https://github.com/icy/pacapt/raw/ng/pacapt

sudo chmod 755 /usr/local/bin/pacapt

sudo ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman || true

yes | sudo pacapt -S zsh curl git
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
