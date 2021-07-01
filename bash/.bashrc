#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# define text editor
export EDITOR=nvim

# Function for Searching the web using w3m text browser in your terminal
w3msearch () {
    local search=$@
    search="${search// /%20}"
    w3m "https://www.duckduckgo.com/?q=$search"
}

# Create Alias for short hand searching using the w3msearch function
alias ?='w3msearch'


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
#export PS1="\e[01;32m[\u@\h \W]\$ \e[m"
export PS1="\[\033[01;32m\][\u@\h\[\033[00m\]:\[\033[01;34m\]\w]\[\033[00m\]\$"


#Path 
export PATH=$PATH:$HOME/.dotfiles/scripts

# Alias to clear screen
alias c=clear

