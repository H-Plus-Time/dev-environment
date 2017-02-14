curl -sL zplug.sh/installer | zsh
echo "source ~/.zplug/init.zsh" >> $HOME/.zshrc
cat partial.zshrc >> $HOME/.zshrc

echo "zplug check || zplug install" >> $HOME/.zshrc
echo "zplug load" >> $HOME/.zshrc
echo "zplug 'zplug/zplug', hook-build:'zplug --self-manage'" >> $HOME/.zshrc
