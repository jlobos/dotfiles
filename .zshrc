#
# Environment variables
#

export ZSH=$HOME/.oh-my-zsh
export EDITOR='nvim'
export LANG='en_US.UTF-8'
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  tmux

  # Type `git open` to open repo website
  git-open
)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

#
# Aliases
#

alias ..='cd ..'
alias e='nvim'
alias q='exit'
alias reload='source ~/.zshrc'
alias gist='gh gist'
alias python='python3'
alias explain='gh copilot explain'
alias json='fx'

# PROMPT
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

#
# Functions
#

function_temperature () {
  # check mac CPU temperature
  sudo powermetrics --samplers smc | grep -i "CPU die temperature"
}

function_update () {
  # Update brew
  brew upgrade
  brew cleanup

  # Update oh-my-zsh
  omz update

  # Update npm packages
  npm update -g

  # Update plugins of nvim
  nvim +PlugUpdate +qall
}
