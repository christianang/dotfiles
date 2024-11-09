export PATH="${PATH}:/usr/bin:${HOME}/.local/bin"

if [[ -z "$(ssh-add -l)" ]]; then
    eval "$(ssh-agent)"
fi
