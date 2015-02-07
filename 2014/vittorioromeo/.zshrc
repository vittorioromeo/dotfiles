ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mh"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/usr/local/lib
alias subl="subl3"
alias updateSystem="yaourt -Syyuua --devel; yaourt -Scc --noconfirm"
unsetopt autocd
