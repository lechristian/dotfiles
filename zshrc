# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="avitcl"

# Update Frequency
export UPDATE_ZSH_DAYS=7

# Plugins
plugins=(git jump)

source $ZSH/oh-my-zsh.sh

# Launch
archey
fortune | cowthink -n -f tux

# Alias
alias clear='clear && archey && fortune | cowthink -n -f tux'

# RVM
export RVMPATH="$PATH:$HOME/.rvm/bin"

# GOLANG
export GOPATH="$HOME/go"

# User configuration
export USRPATH="/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$USRPATH:$RVMPATH:$GOPATH/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

