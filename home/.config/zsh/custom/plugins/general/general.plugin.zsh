function setup_ssh_agent() {
    export SSH_AUTH_SOCK="/tmp/ssh-agent.$(whoami)"
    export SSH_AGENT_PID_FILE="/tmp/ssh-agent.pid.$(whoami)"

    if [[ -f "${SSH_AGENT_PID_FILE}" ]]; then
        export SSH_AGENT_PID="$(cat ${SSH_AGENT_PID_FILE})"
    fi

    if [[ -S "${SSH_AUTH_SOCK}" ]]; then
        return
    fi

    if [[ -n "${SSH_AGENT_PID}" ]] && [[ "$(ps -p $SSH_AGENT_PID -o comm | grep 'ssh-agent')" ]]; then
        return
    fi

    eval "$(ssh-agent)"
    ln -s "${SSH_AUTH_SOCK}" "/tmp/ssh-agent.$(whoami)"
    echo -n "${SSH_AGENT_PID}" > "${SSH_AGENT_PID_FILE}"
    export SSH_AUTH_SOCK="/tmp/ssh-agent.$(whoami)"
}

export PATH="${PATH}:/usr/bin:${HOME}/.local/bin"

setup_ssh_agent