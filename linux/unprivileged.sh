#NO need to run as sudo (in fact, please don't).
#wget and sdkman's dependency (JDK) both need to be installed via your distro's package manager
# OR via one of the scripts in this repo.


#node and npm version manager. This or an alternative npm/node installation method
# are needed for jupyterhub (uses node.js configurable-http-proxy)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
nvm install node

#Unattended miniconda installation
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh
chmod +x miniconda3.sh
bash ~/miniconda.sh -b -p $HOME/miniconda3
export PATH="$HOME/miniconda3/bin:$PATH"
#Update working env with changes to .bashrc file
source ~/.bashrc

#Install any python packages you may want.
conda install --file required_packages.pak || echo No conda package list provided
python setup.py || echo No setup.py

#Package manager for numerous JVM languages/build systems - e.g. Maven, Scala, Groovy
#NB: Requires Java
curl -s http://get.sdkman.io | bash

source ~/.bashrc