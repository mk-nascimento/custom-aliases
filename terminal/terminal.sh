#!/usr/bin/env bash

###########################################################
# Author: Maksuel Nascimento <https://github.com/mk-nascimento>
# Created: September 24, 2023
###########################################################

ZSH_CONFIG="$HOME/.zshrc"

# Show the contents of the custom aliases folder.
alias custom_aliases='cd "$CUSTOM_ALIASES" && lsa;'

# Change the default terminal emulator.
alias change_terminal='sudo update-alternatives --config x-terminal-emulator'

# Open Visual Studio Code in the current directory.
alias codeh='code .; hcc'

# Clear the shell history.
alias hc='history -c'

# Clear the shell history and the current terminal.
alias hcc='hc; clear'

# Clears the shell history and exits the terminal.
alias hx='hcc; exit'

# Shortcut for recursively removing directories.
alias rmvdir='rm -rf'

# Displays the file with repeated logs on the Desktop using 'journalctl'.
alias jlog='sudo journalctl -f > $HOME/Desktop/'

# Reloads the terminal session by restarting the current shell.
reload() {
    local current_shell
    current_shell=$(basename "$SHELL")

    echo  "Current shell: $current_shell"
    exec "$current_shell" || return 1
}

# Update packages using the default package manager (apt or nala if available).
upd() {
    local manager
    manager="apt"

    if command -v nala &>/dev/null; then manager="nala"; fi

    sudo $manager update && sudo $manager upgrade || return 1
}

# Lists the contents of the current directory using 'exa' if available, or falls back to regular 'ls'.
alias ls='_new_ls'
_new_ls() {
    if command -v exa &>/dev/null; then command exa "$@"; else ls "$@"; fi
}

# Cleans the package cache using 'apt' and 'nala' (if it exists).
cleanup() {
    # Check if sudo is available
    if command sudo -v; then
        sudo apt-get autoclean -y && sudo apt-get autoremove -y && sudo apt-get autopurge -y || return 1
        # Check if nala is available
        if command -v nala &>/dev/null; then sudo nala clean && sudo nala autoremove && sudo nala autopurge || return 1; fi
    fi
}

# Removes a Git branch locally and from the remote repository (if provided).
git_remove_branch() {
    if [ -n "$1" ]; then
        git branch -D "$1" && git push origin --delete "$1" || {
            echo -e "Failed to delete branch: $1\n"
            return 1
        }
    else
        echo -e "git: unrecognized branch name\n" && return 1
    fi
}

# Clear the terminal after a 10-second delay.
10s_clear() { sleep 10 && clear || return 1; }

alias set_alias='_set_alias'
_set_alias() {
    # Display example usage:
    if [ $# -lt 2 ]; then
        echo -e "Usage: set_alias <alias-name> <alias-command>\n"
        return 1
    fi

    local alias_name="$1"
    # Remove the first argument (alias_name)
    shift
    local alias_command="$*"

    # Remove double quotes from the beginning and end of alias_command, if present
    alias_command="${alias_command#\"}"
    alias_command="${alias_command%\"}"

    # Remove leading and trailing whitespace from alias_command
    alias_command="$(echo -e "${alias_command}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

    # Check if the alias already exists
    if alias | grep -qE "^$alias_name="; then
        echo -e "The alias '$alias_name' already exists.\n"
    else
        echo -e "\nalias $alias_name='$alias_command'" >>"$CUSTOM_ALIASES/personal/my_custom.sh"
        echo "Alias '$alias_name' added successfully."
        echo -e "Please open a new terminal or reload your current terminal to apply changes.\n"
    fi
}

# If the current shell is zsh and the 'zsh-config' alias is not defined
if [ "$(basename "$SHELL")" = "zsh" ]; then
    # Define the 'zsh-config' alias to open the Zsh configuration file in nano and clear the terminal
    if ! alias | grep -qE zsh_config=; then alias zsh-config='nano $ZSH_CONFIG && hcc'; fi
fi
