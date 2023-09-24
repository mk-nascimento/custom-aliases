#!/usr/bin/env bash

###########################################################
# Author: Maksuel Nascimento <https://github.com/mk-nascimento>
# Created: September 24, 2023
###########################################################

# URL of the custom-aliases repository on GitHub
REPO_URL="git@github.com:mk-nascimento/custom-aliases.git"

# Check if sudo is available
if ! command sudo -v &>/dev/null; then
    echo "Error: sudo command not found. Please install sudo or run this script with appropriate privileges."
    exit 1
fi

if [ -n "$ZSH" ]; then CUSTOM_ALIASES="$ZSH_CUSTOM/custom-aliases"; else CUSTOM_ALIASES="$HOME/.custom-aliases"; fi
load_path="$CUSTOM_ALIASES/load_aliases.sh"

# Check if the custom-aliases folder already exists at the desired location
custom-aliases_install() {
    if [ -d "$CUSTOM_ALIASES" ]; then
        # Folder already exists, updating...
        echo -e "custom-aliases already installed in '$CUSTOM_ALIASES'. Updating...\n"
        cd "$CUSTOM_ALIASES" || {
            echo -e "Error: Failed to change directory to '$CUSTOM_ALIASES'\n"
            return 1
        }
        git pull origin main && cd "$HOME" || return 1
    else
        # Folder doesn't exist, cloning the repository...
        echo -e "custom-aliases not installed. Cloning the repository...\n"
        git clone "$REPO_URL" "$CUSTOM_ALIASES" || {
            echo -e "Error: Failed to change directory to '$CUSTOM_ALIASES'\n"
            return 1
        }
    fi

    # Create a symbolic link for loading custom aliases
    if [ -n "$ZSH" ]; then
        ln -s "$load_path" "$ZSH_CUSTOM/load_custom.zsh"
        rm -rf "$HOME/.custom-aliases" &>/dev/null
    else
        echo ". $load_path" >>"$HOME/.bashrc"
    fi
}

custom-aliases_install
