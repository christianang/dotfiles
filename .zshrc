# Path to your oh-my-zsh installation.
export ZSH=/home/cang/.oh-my-zsh

# Path to go
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"

# Path to rbenv
export RBENVPATH="${HOME}/.rbenv/bin"
export PATH="${RBENVPATH}:${PATH}"

# Base16 Theme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_flat

ZSH_THEME="amuse"

plugins=(git autojump colorize history history-substring-search zsh-syntax-highlighting vi-mode web-search)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

alias ll="ls -al"
alias vim="nvim"
alias reload="source ~/.zshrc"

# setup direnv
eval "$(direnv hook zsh)"

# setup autojump
source /usr/share/autojump/autojump.sh

# setup nvm
export NVM_DIR="/home/cang/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# load rbenv
eval "$(rbenv init -)"

# zsh vi mode
bindkey -v


