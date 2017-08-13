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

. ~/.zsh/aliases # shell aliases
. ~/.zsh/git # git aliases
. ~/.zsh/bash_prompt # prompt config
. ~/.zsh/env # environment variables
