# PATH
export PATH="$HOME/.local/bin:$PATH"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/fzf-opts"
export GOPATH="$XDG_DATA_HOME/go"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# SSH-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Gnupg as SSH-agent
#export SSH_AGENT_PID=""
#export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

# Start sway environment
 if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
   exec $HOME/.local/bin/sway-start
 fi



