#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment Variables 
export SCRIPTS=~/repos/.dotfiles/scripts
export EDITOR=nvim
export PATH="$PATH:$HOME/repos/.dotfiles/scripts:$HOME/.local/bin/:/home/chris/.local/lib/python3.10/site-packages/powerline/bindings/bash/"

## Prompt configuration 
# Original = PS1="\e[01;32m[\u@\h \W]\$ \e[m" 
export PS1="\[\033[01;32m\][\u@\h\[\033[00m\]:\[\033[01;34m\]\w]\[\033[00m\]\[\033[00;32m\]\$(git_branch)\[\033[00m\]\$ "


# Function for Searching the web using w3m text browser in your terminal
w3msearch () {
    local search=$@
    search="${search// /%20}"
    w3m "https://www.duckduckgo.com/?q=$search"
}

# Function to add git branch info to prompt

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}



# Create Alias for short hand searching using the w3msearch function
alias ?='w3msearch'


# Alias for different things
alias vi='nvim'
alias vim='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# If there is no .dircolors file copy settings to file .dircolors
# Second line copy files from /bin/dircolors to ~/.dircolors
[ ! -e ~/.dircolors ] && eval "$(dircolors -p > ~/.dircolors)"
[ -e /bin/dircolors ] && eval "$(dircolors -b ~/.dircolors)"



# Alias to clear screen
alias c=clear


# Creating an Alias to get into scripts
alias scripts='cd $SCRIPTS'

# git Alias
alias gs='git status'
alias gc='git commit'
alias ga='git add'

# Alias for list storage
alias ll='ls -al'



# PowerLine Configuration
#
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /home/chris/.local/lib/python3.10/site-packages/powerline/bindings/bash/powerline.sh

# NVM appliacation to install version of nodejs
source /usr/share/nvm/init-nvm.sh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
