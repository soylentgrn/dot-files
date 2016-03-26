
export HISTSIZE=1000000

#bind "set show-all-if-ambiguous On"

. ~/.zsh/aliases
. ~/.zsh/git

PS1='\[\033[38;5;8m\][\t]\[\]\[\033[38;5;15m\][\[\]\[\]\[\033[38;5;1m\]\u\[\]\[\]\[\033[38;5;15m\]@\[\]\[\]\[\033[38;5;2m\]\h\[\]\[\]\[\033[38;5;15m\] \[\]\[\033[38;5;3m\]\W\[\]\[\033[0m\]]\$ \[\]'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
