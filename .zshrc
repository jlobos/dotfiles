# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#
# Prompt
#

local prefix='▲'
local ret_status="%(?:%{$fg_bold[white]%} $prefix :%{$fg_bold[red]%} $prefix )"
local dir="%{$fg_bold[white]%}%c%{$reset_color%}"

PROMPT='${ret_status} $dir $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="at %{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} *"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#
# Environment variables
#

export ANDROID_HOME="$HOME/Android/Sdk/"
export EDITOR='nvim'
export LANG='en_US.UTF-8'
export VISUAL='nvim'
# Go
export GOPATH=$HOME/.go
export PATH=$GOPATH:$GOPATH/bin:$PATH
# Fixing npm permissions
export PATH=~/.npm-global/bin:$PATH

#
# Aliases
#

alias android='sh ~/Android/Sdk/tools/android'
alias c='clear'
alias ..='cd ..'
alias copy='xclip -selection clipboard'
alias q='exit'
alias reload='source ~/.zshrc'
alias t='tmux'

# List

alias la='ls -AF'
alias ll='ls -alF'
alias ls='ls -X --color=auto'

# Git

alias g='git'
alias s='git status'
alias nb='git checkout -b $(random-word)-$(random-word)'
alias logs="git log --graph --abbrev-commit --all --decorate --pretty=format:'%C(blue)%h%C(reset) · %C(bold green)%cn%C(reset) %C(green)%ar%C(reset) -> %s%C(bold yellow)%d%C(reset)'"

# Neovim

alias e='nvim'
alias vim='nvim'
alias vi='nvim'

# Node.js

alias n='node'

# OS Package Manager

alias ou='yaourt --noconfirm -Syua'
alias oi='yaourt -S'
alias or='yaourt -R'

# Docker

alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'
alias ballenita='if systemctl status docker | grep "inactive"; then systemctl start docker; else systemctl stop docker; fi'

# Instant edit

alias zzz='nvim ~/.dotfiles/.zshrc'
alias vvv='nvim ~/.dotfiles/config/nvim/init.vim'

#
# Others
#

xset r rate 250 60

# Gradle tab completion for bash and zsh
fpath=(/home/j/.zsh/gradle-completion $fpath)
