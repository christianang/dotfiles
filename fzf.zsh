if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Setup fzf
  # ---------
  if [[ ! "${PATH}" == *${HOME}/.fzf/bin* ]]; then
    export PATH="${PATH}:${HOME}/.fzf/bin"
  fi

  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "${HOME}/.fzf/shell/completion.zsh" 2> /dev/null

  # Key bindings
  # ------------
  source "${HOME}/.fzf/shell/key-bindings.zsh"

elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Setup fzf
  # ---------
  if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
    export PATH="$PATH:/usr/local/opt/fzf/bin"
  fi

  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

  # Key bindings
  # ------------
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi
