# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

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

#
# Theme
#

local prefix="▲"
local ret_status="%(?:%{$fg_bold[white]%} $prefix :%{$fg_bold[red]%} $prefix )"
local dir="%{$fg_bold[white]%}%c%{$reset_color%}"

PROMPT='${ret_status} $dir $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="at %{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ✖"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"

#
# Environment variables
#

export EDITOR='nvim'
export LANG='en_US.UTF-8'

export PATH="/usr/local/sbin:$PATH"

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

#
# Aliases
#

alias ..='cd ..'
alias c='clear && history -c &> /dev/null'
alias q='exit'
alias reload='source ~/.zshrc'

# Git
alias g='git'
alias multipull="find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;"

# Neovim
alias e='nvim'
