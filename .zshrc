# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/jlobos/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="default"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#
# Environment variables
#

export ANDROID_HOME='/home/jlobos/Android/Sdk/'
export VISUAL='nvim'
export EDITOR='nvim'

#
# Aliases
#

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias android='sh ~/Android/Sdk/tools/android'
alias tr='source ~/.zshrc'
alias c='clear'
alias copy='xclip -selection clipboard'
alias date='date "+%a %d %b %Y %H:%M"'
alias d='pwd'
alias f='feh --scale-down'
alias hc='history -c'
alias h='heroku'
alias la='ls -A'
alias ll='ls -alF'
alias lol='lolcat -a'
alias ls='ls -X --color=auto'
alias l='tree -L 1 -Calsh'
alias nyan='telnet nyancat.dakko.us'
alias onion-stop='systemctl stop tor'
alias onion='systemctl start tor && firefox --private-window'
alias o='rhc'
alias p='sudo pacman'
alias q='exit'
alias t='tmux -2'
alias vol='amixer get Master | grep -E -o "[0-9]{1,3}?%" | head -1 | rev | cut -c 2- | rev '
alias wifi='sudo create_ap wlp1s0 enp0s20u1 jlobitu meportobienmamita'

# git

alias g='git'
alias gl='git lg'
alias s='git status'

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

alias i='npm i'
alias r='npm r'
alias npm-update='sudo npm-check -u -g'
alias run='npm run -loglevel silent'

# yarn

alias ya='yarn add'
alias yd='yarn add --dev'
alias yr='yarn remove'
alias yt='yarn test'
alias yu='yarn upgrade-interactive'
alias y='yarn'

# OS Package Manager

alias os-update='yaourt --noconfirm -Syua'
alias os-install='yaourt -S'
alias os-remove='yaourt -R'

#
# Others
#

xset r rate 250 60
# RubyGems
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
