export ZSH="${HOME}/.oh-my-zsh"

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
