# Setup for SSH agent used in
# ~/.config/systemd/user/ssh-agent.service
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Use KDE Wallet to unlock ssh keys. Which in order
# triggers ~/.config/autostart_scripts/ssh_add.sh
export SSH_ASKPASS="/usr/bin/ksshaskpass"

# Set options for make to use 8 processors
export MAKEFLAGS="-j$(nproc)"

# Set JAVA_HOME
export JAVA_HOME="/usr/bin/java"
