[ -z "$PS1" ] && return
shopt -s histappend

export HISTSIZE=1000000
HISTCONTROL=ignoreboth
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

bind "set show-all-if-ambiguous On"

. ~/.zsh/aliases
. ~/.zsh/git
. ~/.zsh/bash_prompt # prompt config

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
