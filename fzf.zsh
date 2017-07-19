# Setup fzf
# ---------
if [[ ! "$PATH" == */home/cang/.fzf/bin* ]]; then
  export PATH="$PATH:/home/cang/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/cang/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/cang/.fzf/shell/key-bindings.zsh"

