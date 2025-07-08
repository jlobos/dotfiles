#
# Environment variables
#

export ZSH=$HOME/.oh-my-zsh
export EDITOR='nvim'
export LANG='en_US.UTF-8'
export HISTCONTROL=ignoreboth

# bun
export BUN_PATH="$HOME/.bun/bin"
# go
export GO_PATH="$HOME/go/bind"
# fzf
export FZF_DEFAULT_OPTS='--tmux center --layout reverse'

# ruby
export RUBY_PATH="/usr/local/opt/ruby/bin"
export GEM_HOME="$HOME/.gem/bin"

# android
export PLATFORM_TOOLS=~/Library/Android/sdk/platform-tools

export PATH="$PATH:$BUN_PATH:$GO_PATH:$RUBY_PATH:$GEM_HOME:$PLATFORM_TOOLS"

# node
export NODE_OPTIONS='--disable-warning=ExperimentalWarning'

plugins=(
  git
  fzf-tab
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
alias reload='source ~/.zshrc && tmux source ~/.tmux.conf'
alias gist='gh gist'
alias python='python3'
alias explain='gh copilot explain'
alias json='fx'
alias cd='z' # zoxide
alias paste='pbpaste'
alias copy='pbcopy'
# ia powered
alias copilot="nvim --cmd 'autocmd VimEnter * lua _G.chat()'"
alias commit="nvim +CopilotChatCommit"

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

  # Update plugins of tmux
  ~/.tmux/plugins/tpm/bin/update_plugins all
}

function_free_space () {
  diskutil info / | awk '/Free Space/ {print $4 $5}'
}
