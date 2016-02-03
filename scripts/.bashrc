#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='\w \[\e[1;32m\]\$\[\e[0;0m\] '
