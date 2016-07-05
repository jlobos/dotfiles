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
source ~/.dotfiles/config/base16-shell/scripts/base16-oceanicnext.sh

#
# alias
#

alias babel='./node_modules/.bin/babel-node'
alias br='source ~/.bashrc'
alias c='clear'
alias e='nvim'
alias f='feh --scale-down'
alias g='git'
alias i='npm i'
alias ls='ls -X --color=auto'
alias l='tree -L 1 -Calsh'
alias n='node'
alias npmupgrade='sudo sh ~/.dotfiles/config/npm/npm-upgrade.sh'
alias nyan='telnet nyancat.dakko.us'
alias p='sudo pacman'
alias r='npm r'
alias s='git status'
alias t='tree'
alias vim='nvim'
alias wifi='sudo create_ap wlp1s0 enp0s20u4 jlobitu mamitatequieromucho'
alias y='yaourt --noconfirm'

open() { xdg-open $1 &> /dev/null & }
ga() { git add $1; }
gc() { git commit -m "$*"; }

#
# encrypt & decrypt
#

encrypt() {
  tar czvpf - $1 | \
  gpg --symmetric --cipher-algo aes256 -o ${1%/}.encrypt && rm $1 -rf
}

decrypt() {
  gpg -d $1 | tar xzvf -
}

#
# others
#

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH" # RubyGems

#
# prompt
#

PS1='\w \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[1;32m\]• \[\e[1;33m\]• \[\e[1;31m\]• \[\e[0m\]'

