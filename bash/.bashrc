[[ -f ~/.bashrc_lib ]] && source ~/.bashrc_lib

# set history settings
HISTTIMEFORMAT="%Y%m%d %T "

# set PATH so it includes user's private bin if it exists
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:$PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export PATH

# Call functions defined in ~/.bashrc_lib inside the PS1 declaration
#export PS1='\[$(git_color)\][$(parse_git_branch)]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \$ '
export PS1='\[$(git_color)\][$(parse_git_branch)]\[\033[01;32m\]\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \$ '

# set autocomplete
complete -F _complete_hosts ssh
complete -F _complete_hosts host

# alias
alias clean-virgul="find . -regex \".*~$\" -exec echo rm {} \; -exec rm {} \;"
alias grep="grep --color"
alias fucking="sudo"
alias ducks="du -cksh * | sort -rn | head -10"
alias fishes="find . -type f -printf '%s %p\n'| sort -nr | head -10"
alias docker_rm_stopped="docker ps -aq --no-trunc | xargs docker rm"
alias docker_rm_dangling="docker images -q --filter dangling=true | xargs docker rmi"

# log every command
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'