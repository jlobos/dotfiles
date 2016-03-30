#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors
# export TERM=xterm-256color

# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

alias ls='ls --color=auto'
alias i='npm i'
alias r='npm r'
alias s='git status'
alias e='atom'
alias c='clear'

source ~/.dotfiles/git-prompt.sh

PS1='\w \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[1;32m\]\$ \[\e[0m\]'

# RubyGems
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
