#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# PS1='\w \[\e[1;32m\]\$\[\e[0;0m\] '

source ~/dotfiles/git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
