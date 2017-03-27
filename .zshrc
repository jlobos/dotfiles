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

local ret_status="%(?:%{$fg_bold[magenta]%} ▰ :%{$fg_bold[red]%} ▰ )"
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
alias copy='xclip -selection clipboard'
alias date='date "+%a %d %b %Y %H:%M"'
alias f='feh --scale-down'
alias h='heroku'
alias la='ls -A'
alias ll='ls -alF'
alias lol='lolcat -a'
alias ls='ls -X --color=auto'
alias l='tree -L 1 -Calsh'
alias nyan='telnet nyancat.dakko.us'
alias onion-start='systemctl start tor && firefox --private-window'
alias onion-stop='systemctl stop tor'
alias o='rhc'
alias p='pwd'
alias q='exit'
alias reload='source ~/.zshrc'
alias t='tmux -2'
alias v='amixer get Master | grep -E -o "[0-9]{1,3}?%" | head -1 | rev | cut -c 2- | rev'

# git

alias gs='git status'
alias gl='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias g='git'

# nvim

alias e='nvim'
alias vim='nvim'
alias vi='nvim'

# node

alias babel='./node_modules/.bin/babel-node'
alias babelwatch='./node_modules/.bin/babel --watch'
alias n='node'
alias nodemon-babel='nodemon --exec ./node_modules/.bin/babel-node'

# npm

alias nb='npm run build'
alias nc='npm run clean'
alias nd='npm run dev'
alias ni='npm install'
alias np='npm publish'
alias nr='npm remove'
alias ns='npm start'
alias nt='npm test'
alias npm-update='sudo npm-check -u -g'

# yarn

alias ya='yarn add'
alias yb='yarn run build'
alias yc='yarn run clean'
alias yd='yarn add --dev'
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
alias dstart='sudo systemctl start docker'
alias dstop='sudo systemctl stop docker'

#
# Others
#

xset r rate 250 60

# This loads nvm
export NVM_DIR='/home/jlobos/.nvm'
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
