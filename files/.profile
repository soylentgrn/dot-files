[ -f ~/.bashrc ] && . ~/.bashrc
export PATH=$PATH:/Users/msean/Documents/scripts/mac
export HISTTIMEFORMAT='%D %R '

# VMware Fusion
if [ -d "/Applications/VMware Fusion.app/Contents/Library" ]; then
    export PATH=$PATH:"/Applications/VMware Fusion.app/Contents/Library"
fi

PS1='\[\033[38;5;8m\][\t]\[\]\[\033[38;5;15m\][\[\]\[\]\[\033[38;5;1m\]\u\[\]\[\]\[\033[38;5;15m\]@\[\]\[\]\[\033[38;5;2m\]\h\[\]\[\]\[\033[38;5;15m\] \[\]\[\033[38;5;3m\]\W\[\]\[\033[0m\]]\$ \[\]'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
