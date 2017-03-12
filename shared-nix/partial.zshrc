source $HOME/.zplug/init.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export GOPATH=$HOME/goprojects
export PATH=$GOPATH/bin:$PATH
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "supercrabtree/k"
zplug "djui/alias-tips"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "sorin-ionescu/prezto", use:modules/git/alias.zsh
zplug "hlissner/zsh-autopair", defer:3

# prompt
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug check || zplug install
zplug load
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
