zplug "tcnksm/docker-alias", use:zshrc

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "rimraf/k"
zplug "djui/alias-tips"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "sorin-ionescu/prezto", use:modules/git/alias.zsh
zplug "mrowa44/emojify", as:command, use:emojify
zplug "b4b4r07/emoji-cli"
zplug "hlissner/zsh-autopair", defer:3

# prompt
zplug mafredri/zsh-async, from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
