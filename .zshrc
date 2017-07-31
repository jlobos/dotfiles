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

export ANDROID_HOME='/home/jlobos/Android/Sdk/'
export EDITOR='nvim'
export LANG='es_CL.UTF-8'
export VISUAL='nvim'
# ruby
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# go
export GOPATH=$HOME/.go
export PATH=$GOPATH:$GOPATH/bin:$PATH

#
# Aliases
#

alias android='sh ~/Android/Sdk/tools/android'
alias c='clear'
alias ..='cd ..'
alias copy='xclip -selection clipboard'
alias count='ls -l | wc -l'
alias date='date "+%a %d %b %Y %H:%M"'
alias lol='lolcat -a'
alias nyan='telnet nyancat.dakko.us'
alias q='exit'
alias reload='source ~/.zshrc'
alias t='tmux'
alias v='amixer get Master | grep -E -o "[0-9]{1,3}?%" | head -1 | rev | cut -c 2- | rev'
alias wifi='sudo create_ap wlp1s0 enp0s20u4 jlobitu meportobienmamita'
alias z='zathura --fork'

# List

alias la='ls -AF'
alias ll='ls -alF'
alias ls='ls -X --color=auto'

# Tor

alias onion-start='systemctl start tor && firefox --private-window'
alias onion-stop='systemctl stop tor'

# Git

alias g='git'
alias ga='git a'
alias gc='git c'
alias gd='git d'
alias gl='git l'
alias gs='git s'

# Nvim

alias e='nvim'
alias vim='nvim'
alias vi='nvim'

# Node.js

alias n='node'

# Npm

alias nb='npm run build'
alias nc='npm run clean'
alias nd='npm run dev'
alias ni='npm install'
alias np='npm publish'
alias nr='npm remove'
alias ns='npm start'
alias nt='npm test'
alias nu='sudo npm-check -u -g'

# Yarn

alias ya='yarn add'
alias yb='yarn run build'
alias yc='yarn run clean'
alias yd='yarn add --dev'
alias yl='yarn lint'
alias yr='yarn remove'
alias ys='yarn start'
alias yt='yarn test'
alias yu='yarn upgrade-interactive'
alias y='yarn'

# OS Package Manager

alias ou='yaourt --noconfirm -Syua'
alias oi='yaourt -S'
alias or='yaourt -R'

# Docker

alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'
alias ballenita='if systemctl status docker | grep "inactive"; then systemctl start docker; else systemctl stop docker; fi'

# Python

alias py='python'
alias py2='python2'

# Virtualenv

alias ve='virtualenv'
alias activate='source bin/activate'

# Instant edit

alias zzz='nvim ~/.dotfiles/.zshrc'
alias vvv='nvim ~/.dotfiles/init.vim'

#
# Others
#

xset r rate 250 60

# listen music is love
# commands: love next, prev, pause or play

function love {
  case $1 in
    'next' ) playerctl next;;
    'prev' ) playerctl previous;;
    'pause' | 'play' ) playerctl play-pause;;
  esac
}

# This loads nvm
export NVM_DIR='/home/jlobos/.nvm'
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# added by travis gem
[ -f /home/jlobos/.travis/travis.sh ] && source /home/jlobos/.travis/travis.sh
