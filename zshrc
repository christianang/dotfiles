# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Theme
source ~/.base16_theme
ZSH_THEME=""
plugins=(git fasd colorize history history-substring-search zsh-syntax-highlighting vi-mode web-search)

# Path to go
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"

# Path to rbenv
export RBENVPATH="${HOME}/.rbenv/bin"
export PATH="${RBENVPATH}:${PATH}"

fpath=( "$HOME/.zfunctions" $fpath )


source $ZSH/oh-my-zsh.sh

source $HOME/.config/zsh-git-prompt/zshrc.sh

autoload -U promptinit; promptinit
prompt pure

alias ll="ls -al"
alias vim="nvim"
alias reload="source ~/.zshrc"
alias docker_rm_all="docker ps --all | cut -d" " -f1 | grep -v CONTAINER | xargs -n 1 docker rm"

# setup direnv
eval "$(direnv hook zsh)"

# setup fasd
eval "$(fasd --init auto)"

# setup nvm
export NVM_DIR="/home/cang/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# load rbenv
eval "$(rbenv init -)"

# zsh vi mode
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# functions
source ${HOME}/.zsh-functions/mysql
