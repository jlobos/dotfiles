#
# Environment variables
#

export ZSH=$HOME/.oh-my-zsh
export EDITOR='nvim'
export LANG='en_US.UTF-8'
# export PATH="$PATH:/usr/local/sbin"
# export PATH="$PATH:$HOME/.cargo/bin"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions

  # Type `git open` to open repo website
  git-open
)

source $ZSH/oh-my-zsh.sh

# PROMPT
eval "$(starship init zsh)"

#
# Aliases
#

alias ..='cd ..'
alias e='nvim'
alias q='exit'
alias reload='source ~/.zshrc'
alias gist='gh gist'

#
# Functions
#

function_update () {
  # Update brew
  brew upgrade

  # Update oh-my-zsh
  omz update

  # Update plugins of nvim
  nvim +PlugUpdate +qall
}
