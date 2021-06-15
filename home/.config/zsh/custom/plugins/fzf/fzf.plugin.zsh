if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [[ -d "/usr/share/fzf/completion.zsh" ]]; then
    # Auto-completion
    # ---------------
    source "/usr/share/fzf/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/share/fzf/key-bindings.zsh"
  else
    # Auto-completion
    # ---------------
    source "/usr/share/doc/fzf/examples/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/share/doc/fzf/examples/key-bindings.zsh"
  fi

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
