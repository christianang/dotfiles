export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/workspace/dotfiles/zsh-custom"

plugins=(
  general
  vi-mode
  base16
  pureprompt
  fzf
  fasd
  direnv
  zsh-syntax-highlighting
  history-substring-search
  golang
  rust
  ruby
  aliases
)

source "${ZSH}/oh-my-zsh.sh"
