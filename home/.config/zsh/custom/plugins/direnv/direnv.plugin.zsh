# check if direnv is installed
if [ $commands[direnv] ]; then
  eval "$(direnv hook zsh)"
fi

