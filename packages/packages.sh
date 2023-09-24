#!/usr/bin/env bash

###########################################################
# Author: Maksuel Nascimento <https://github.com/mk-nascimento>
# Created: September 24, 2023
###########################################################

# Uninstalls a Flatpak package and deletes its associated data.
flatpak_remove() {
    flatpak uninstall --delete-data "$@" ||
        return 1
}

# Repairs the Flatpak installation.
flatpak_repair() {
    sudo flatpak repair ||
        return 1
}

# Uninstalls all Flatpak packages and deletes their associated data.
flatpak_reset() {
    flatpak uninstall --all --delete-data ||
        return 1
}

# Removes a Snap package and purges its associated data.
snap_remove() {
    sudo snap remove --purge "$@" ||
        return 1
}

# Refreshes Snap packages.
snap_refresh() {
    sudo snap refresh ||
        return 1
}
