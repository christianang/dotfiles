export PATH="${PATH}:/usr/bin"

if [[ -z "$(ssh-add -l)" ]]; then
    eval "$(ssh-agent)"
fi
