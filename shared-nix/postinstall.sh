sudo apt-get install -y ghc cabal-install haskell-stack
cabal update
stack install github-backup
cd $HOME
mkdir Projects && cd Projects
github-backup H-Plus-Time
