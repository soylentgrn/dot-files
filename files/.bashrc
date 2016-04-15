[ -z "$PS1" ] && return
shopt -s histappend

export HISTSIZE=1000000
export HISTTIMEFORMAT='%D %R '
HISTCONTROL=ignoreboth
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

bind "set show-all-if-ambiguous On"
set horizontal-scroll-mode Off

# VMware Fusion
if [ -d "/Applications/VMware Fusion.app/Contents/Library" ]; then
  export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"
fi

#ovf tool
if [ -d "/Applications/VMware OVF Tool/ovftool" ]; then
  export PATH=$PATH:"/Applications/VMware OVF Tool/ovftool"
fi

if [ -d "$HOME/Documents/scripts/mac" ]; then
  export PATH=$PATH:$HOME/Documents/scripts/mac
fi

export PATH=$PATH:$HOME/bin

. ~/.zsh/aliases
. ~/.zsh/git
. ~/.zsh/bash_prompt # prompt config

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
