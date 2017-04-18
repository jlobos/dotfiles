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

local ret_status="%(?:%{$fg_bold[magenta]%} ▽ :%{$fg_bold[red]%} ▽ )"
PROMPT='${ret_status} %{$reset_color%}$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{242}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{242} *"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#
# Environment variables
#

export ANDROID_HOME='/home/jlobos/Android/Sdk/'
export EDITOR='nvim'
export LANG='es_CL.UTF-8'
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export VISUAL='nvim'

#
# Aliases
#

alias android='sh ~/Android/Sdk/tools/android'
alias c='clear'
alias ..='cd ..'
alias copy='xclip -selection clipboard'
alias date='date "+%a %d %b %Y %H:%M"'
alias du='du -h'
alias f='feh --scale-down'
alias h='heroku'
alias lol='lolcat -a'
alias nyan='telnet nyancat.dakko.us'
alias o='rhc'
alias p='pwd'
alias q='exit'
alias reload='source ~/.zshrc'
alias t='tree -C'
alias v='amixer get Master | grep -E -o "[0-9]{1,3}?%" | head -1 | rev | cut -c 2- | rev'

# list

alias la='ls -AF'
alias ll='ls -alF'
alias ls='ls -X --color=auto'

# tor

alias onion-start='systemctl start tor && firefox --private-window'
alias onion-stop='systemctl stop tor'

# git

alias g='git'

# nvim

alias e='nvim'
alias vim='nvim'
alias vi='nvim'

# node

alias n='node'

# npm

alias nb='npm run build'
alias nc='npm run clean'
alias nd='npm run dev'
alias ni='npm install'
alias np='npm publish'
alias nr='npm remove'
alias ns='npm start'
alias nt='npm test'
alias nu='sudo npm-check -u -g'

# yarn

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
alias dm='docker-machine'
alias docker-start='sudo systemctl start docker'
alias docker-stop='sudo systemctl stop docker'

#
# Others
#

xset r rate 250 60

# This loads nvm
export NVM_DIR='/home/jlobos/.nvm'
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# added by travis gem
[ -f /home/jlobos/.travis/travis.sh ] && source /home/jlobos/.travis/travis.sh
