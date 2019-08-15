export ZSH="${HOME}/.oh-my-zsh"

plugins=(
  general
  vi-mode
  base16
  pureprompt
  fzf
  fasd
#  rbenv
  direnv
  zsh-syntax-highlighting
  history-substring-search
  golang
  rust
  aliases
)

source "${ZSH}/oh-my-zsh.sh"
