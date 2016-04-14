#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# exports
#

export LANG=es_CL.UTF-8

#
# source
#

source ~/.dotfiles/config/git/git-prompt.sh
source ~/.dotfiles/colors.sh

#
# alias
#

alias ls='ls -S --color=auto'
alias i='npm i'
alias r='npm r'
alias s='git status'
alias e='nvim'
alias c='clear'
alias vim='nvim'
alias br='source ~/.bashrc'           # reload bashrc
alias nyan='telnet nyancat.dakko.us'  # nyan cat
alias spotify='spotify  --force-device-scale-factor=1.0000001'

#
# others
#

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH" # RubyGems

#
# out
#

PS1='\w \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[1;32m\]• \[\e[1;33m\]• \[\e[1;31m\]• \[\e[0m\]'

