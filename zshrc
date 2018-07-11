# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load nodenv
eval "$(nodenv init -)"

# Load rbenv
eval "$(rbenv init -)"

