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

PS1='\[\033[38;5;8m\][\t]\[\]\[\033[38;5;15m\][\[\]\[\]\[\033[38;5;1m\]\u\[\]\[\]\[\033[38;5;15m\]@\[\]\[\]\[\033[38;5;2m\]\h\[\]\[\]\[\033[38;5;15m\] \[\]\[\033[38;5;3m\]\W\[\]\[\033[0m\]]\$ \[\]'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
