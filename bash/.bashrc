#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim

# Environment Variables 
export SCRIPTS=~/repos/.dotfiles/scripts
export EDITOR=nvim
export PATH="~/repos/.dotfiles/scripts:$PATH"

PS1='[\u@\h \W]\$ '

# If there is no .dircolors file copy settings to file .dircolors
[ ! -e ~/.dircolors ] && eval $(dircolors -p > ~/.dircolors)
[ -e /bin/dircolors ] && eval $(dircolors -b ~/.dircolors)


# Function for Searching the web using w3m text browser in your terminal
w3msearch () {
    local search=$@
    search="${search// /%20}"
    w3m "https://www.duckduckgo.com/?q=$search"
}

# Create Alias for short hand searching using the w3msearch function
alias ?='w3msearch'


# Alias for different things
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias grep='egrep --color=auto'
alias grep='fgrep --color=auto'
alias vi='nvim'
alias vim='nvim'
alias c=clear
alias scripts='cd $SCRIPTS'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias ll='ls -al'


# starship prompt
eval "$(starship init bash)"

# NVM appliacation to install version of nodejs
# source /usr/share/nvm/init-nvm.sh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
