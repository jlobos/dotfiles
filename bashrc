#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# exports
#

export TERM='xterm-256color'
export LANG='es_CL.UTF-8'
export VISUAL='nvim'

#
# source
#

source ~/.dotfiles/config/git/git-prompt.sh
source ~/.dotfiles/colors.sh

#
# alias
#

alias br='source ~/.bashrc'           # reload bashrc
alias c='clear'
alias e='nvim'
alias f='feh --scale-down'
alias g='git'
alias i='npm i'
alias ls='ls -X --color=auto'
alias n='node'
alias nyan='telnet nyancat.dakko.us'  # nyan cat
alias p='sudo pacman'
alias r='npm r'
alias s='git status'
alias t='tree'
alias vim='nvim'
alias y='yaourt'

open() { xdg-open $1 &> /dev/null & }
ga() { git add $1; }
gc() { git commit -m "$*"; }

#
# others
#

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH" # RubyGems

#
# prompt
#

PS1='\w \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[1;32m\]• \[\e[1;33m\]• \[\e[1;31m\]• \[\e[0m\]'

