#!/bin/zsh
echo $(arch)
function translate_arch {
    if [[ $(arch) == aarch64 ]]
    then
        echo 'armv7l'
    else
        echo $(arch)
    fi
}
echo $(translate_arch)
## grab python niceties
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-$(translate_arch).sh -O ./miniconda3.sh
chmod +x ./miniconda3.sh
yes "yes" | bash ./miniconda3.sh -b -p $HOME/miniconda3
echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.zshrc
rm miniconda3.sh
export PATH="$HOME/miniconda3/bin:$PATH"
if [[ $(arch) == aarch64 ]]
then
    # rpi required to satisfy dependencies
    sed -ie "s#'armv6l', 'armv7l'#'armv6l', 'armv7l', 'aarch64'#g" \
        $HOME/miniconda3/lib/python3.4/site-packages/conda/config.py
    sed -ie "s#arch_name = machine()#arch_name = machine()\n    if arch_name == 'aarch64':\n        arch_name = 'armv7l'#g" \
        $HOME/miniconda3/lib/python3.4/site-packages/conda/config.py
    conda install python=3.6 -y
    replace_text="'linux' and m in non_x86_linux_machines:"
    s4="    "
    s8="        "
    # Correct arch_name
    text="${s4}${s8}if m == 'aarch64':"
    text_p2="${s8}${s8}return 'armv7l'"
    sed -ie "s#${replace_text}#${replace_text}\n${text}\n${text_p2}#g" \
        $HOME/miniconda3/lib/python3.6/site-packages/conda/base/context.py

    # Always access m via the modified arch_name func
    replace_text="${s4}${s8}return 'linux-%s' % m"
    text="return 'linux-%s' % self.arch_name"
    sed -ie "s#${replace_text}#${s8}${s4}${text}#g" \
        $HOME/miniconda3/lib/python3.6/site-packages/conda/base/context.py
    # Add aarch64 to the list of non_x86_linux_machines arches
    sed -ie "s#non_x86_linux_machines = {#non_x86_linux_machines = {\n${s4}'aarch64',#g" \
        $HOME/miniconda3/lib/python3.6/site-packages/conda/base/context.py
fi
