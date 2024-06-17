#!/usr/bin/env bash

###########################################################
# Author: Maksuel Nascimento <https://github.com/mk-nascimento>
# Created: September 24, 2023
###########################################################

# Check if sudo is available
if ! command sudo -v &>/dev/null; then
    echo "Error: sudo command not found. Please install sudo or run this script with appropriate privileges."
    exit 1
fi

# Check if the custom-aliases folder already exists at the desired location
_cai() { # custom-aliases-install
    # URL of the custom-aliases repository on GitHub
    local repo_url="https://github.com/mk-nascimento/custom-aliases.git"

    if [ -n "$ZSH" ]; then custom_aliases="$ZSH/custom/custom-aliases"; else custom_aliases="$HOME/.custom-aliases"; fi
    local load_path="$custom_aliases/load_aliases.sh"

    if [ -d "$custom_aliases" ]; then
        # Folder already exists, updating...
        echo -e "custom-aliases already installed in '$custom_aliases'. Updating...\n"
        cd "$custom_aliases" || {
            echo -e "Error: Failed to change directory to '$custom_aliases'\n"
            return 1
        }
        git pull origin main && cd "$HOME" || return 1
    else
        # Folder doesn't exist, cloning the repository...
        echo -e "custom-aliases not installed. Cloning the repository...\n"
        git clone --single-branch -b main --depth 1 "$repo_url" "$custom_aliases" || {
            echo -e "Error: Failed to change directory to '$custom_aliases'\n"
            return 1
        }
    fi

    # Create a symbolic link for loading custom aliases
    if [ -n "$ZSH" ]; then
        ln -sf "$load_path" "$ZSH/custom/load_custom.zsh"
        rm -rf "$HOME/.custom-aliases" &>/dev/null
    else
        echo ". $load_path" >>"$HOME/.bashrc"
    fi

    chmod +x "$custom_aliases/install.sh" &>/dev/null
}

_cai
