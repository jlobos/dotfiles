#
# ~/.bashrc
#

export LANG=es_CL.UTF-8

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors
# export TERM=xterm-256color

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-default.light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

alias ls='ls --color=auto'
alias i='npm i'
alias r='npm r'
alias s='git status'
alias e='nvim'
alias c='clear'
alias vim='nvim'
alias br='source ~/.bashrc'           # reload bashrc
alias nyan='telnet nyancat.dakko.us'  # nyan cat

source ~/.dotfiles/git-prompt.sh

PS1='\w \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[1;32m\]\$ \[\e[0m\]'
# PS1='\w \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[1;32m\]• \[\e[0m\]'

# RubyGems
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
