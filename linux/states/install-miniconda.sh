wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-$(arch).sh -O ./miniconda3.sh
chmod +x ./miniconda3.sh
yes "yes" | bash ./miniconda3.sh -b -p $HOME/miniconda3
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
rm miniconda3.sh
export PATH="$HOME/miniconda3/bin:$PATH"
