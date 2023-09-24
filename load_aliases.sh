#!/usr/bin/env bash

###########################################################
# Author: Maksuel Nascimento <https://github.com/mk-nascimento>
# Created: September 24, 2023
###########################################################

# Check if Oh-My-Zsh is installed.
if [ -n "$ZSH" ]; then CUSTOM_ALIASES="$ZSH_CUSTOM/custom-aliases"; else CUSTOM_ALIASES="$HOME/.custom-aliases"; fi

# Iterate over each subdirectory inside 'custom-aliases'.
for subdir in "$CUSTOM_ALIASES"/*/; do
    # Check if the subdirectory is valid and contains shell script files.
    if [ -d "$subdir" ] && [ -n "$(find "$subdir" -maxdepth 1 -type f)" ]; then
        # Iterate over each shell script file.
        for script in "$subdir"*.sh; do
            # Check if the file is valid and source (execute) the script.
            if [ -f "$script" ]; then
                # shellcheck source=/dev/null
                source "$script"
            fi
        done
    fi
done

export CUSTOM_ALIASES
