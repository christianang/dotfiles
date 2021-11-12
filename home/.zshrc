export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.config/zsh/custom"

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
  android
  flutter
)

source "${ZSH}/oh-my-zsh.sh"
