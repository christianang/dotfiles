export PATH="${PATH}:/usr/bin:${HOME}/.local/bin"

if [[ -z "$(ssh-add -l 2> /dev/null)" ]]; then
    eval "$(ssh-agent)"
fi
