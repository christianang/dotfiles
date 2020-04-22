#!/bin/bash -eu

function clone_or_pull() {
  local repo="${1}"
  local location="${2}"
  if [[ -d "${location}" ]]; then
    echo "Pulling ${location}..."
    git -C "${location}" pull
  else
    git clone "${repo}" "${location}"
  fi
}

function setup_nvim() {
  nvim -c "PlugInstall" -c "qall!" --headless
  nvim -c "PlugUpdate" -c "qall!" --headless
}

function setup_powerline() {
  ${HOME}/.config/powerline/fonts/install.sh
}

clone_or_pull "https://github.com/powerline/fonts.git" "${HOME}/.config/powerline/fonts"
clone_or_pull "https://github.com/abertsch/Menlo-for-Powerline" "${HOME}/.config/fonts/menlo-for-powerline"
clone_or_pull "https://github.com/chriskempson/base16-shell" "${HOME}/.config/base16-shell"
clone_or_pull "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${HOME}/.config/zsh/custom/plugins/zsh-syntax-highlighting"
clone_or_pull "https://github.com/sindresorhus/pure" "${HOME}/.config/pure"
clone_or_pull "https://github.com/robbyrussell/oh-my-zsh.git" "${HOME}/.oh-my-zsh"

setup_nvim
setup_powerline
