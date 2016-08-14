#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

OS=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om)

#
# exports
#

export ANDROID_HOME='/home/jlobos/Android/Sdk/'
export LANG='es_CL.UTF-8'
export TERM='xterm-256color'
export VISUAL='nvim'

#
# source
#

source ~/.dotfiles/config/git/git-prompt.sh
source ~/.dotfiles/config/base16-shell/scripts/base16-3024.sh

#
# alias
#

alias android='sh ~/Android/Sdk/tools/android'
alias babel='./node_modules/.bin/babel-node'
alias babelwatch='./node_modules/.bin/babel --watch'
alias br='source ~/.bashrc'
alias c='clear'
alias copy='xclip -selection clipboard'
alias d='pwd'
alias e='nvim'
alias f='feh --scale-down'
alias g='git'
alias gl='git lg'
alias h='heroku'
alias i='npm i'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls -X --color=auto'
alias l='tree -L 1 -Calsh'
alias n='node'
alias npmupgrade='sudo sh ~/.dotfiles/config/npm/npm-upgrade.sh'
alias nyan='telnet nyancat.dakko.us'
alias o='rhc'
alias p='sudo pacman'
alias q='exit'
alias r='npm r'
alias run='npm run -loglevel silent'
alias s='git status'
alias t='tree'
alias vim='nvim'
alias wifi='sudo create_ap wlp1s0 enp0s20u1 jlobitu mamitatequieromucho'

if [ "$OS" == 'NAME="Ubuntu 14.04.5 LTS"' ]; then
  alias u='sudo apt-get update && sudo apt-get upgrade'
  alias add='sudo apt-get install'
  alias remove='sudo apt-get remove'
elif [ "$OS" == 'NAME="Arch Linux"' ]; then
  alias u='yaourt --noconfirm -Syua'
  alias add='yaourt -S'
  alias remove='yaourt -R'
fi

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

HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

#
# prompt
#

# PS1=' \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[1;32m\]◉ \[\e[1;33m\]◉ \[\e[1;31m\]◉ \[\e[0m\]'
PS1=' \[\e[1;35m\]$(__git_ps1 "(%s)") \[\e[1;32m\]➡ \[\e[0m\]'
