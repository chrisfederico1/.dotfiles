#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# define text editor
export EDITOR=nvim


# Alias for different things
alias vi='nvim'
alias vim='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'


[ ! -e ~/.dircolors ] && eval $(dircolors -p > ~/.dircolors)
[ -e /bin/dircolors ] && eval $(dircolors -b ~/.dircolors)

# Original Bash colors
#PS1='[\u@\h \W]\$ '

# New Bash colors
export PS1="\e[0;32m[\u@\h \W]\$ \e[m"
