#
# Environment variables
#

export ZSH=$HOME/.oh-my-zsh
export EDITOR='nvim'
export LANG='en_US.UTF-8'
export PATH="/usr/local/sbin:$PATH"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions

  # Type `git open` to open repo website
  git-open

  # OSX plugin
  osx
)

source $ZSH/oh-my-zsh.sh
source ~/.fzf.zsh
source /usr/local/etc/profile.d/z.sh

# prompt
eval "$(starship init zsh)"

#
# Aliases
#

alias ..='cd ..'
alias e='nvim'
alias q='exit'
alias reload='source ~/.zshrc'
