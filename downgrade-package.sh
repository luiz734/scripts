#! /usr/bin/env bash

# downgrande arch packages

PACKAGE=$(ls /var/cache/pacman/pkg -t | grep -vE '\.(sig)$' | gum filter)

if [ -n "$PACKAGE" ]; then
    eval "sudo pacman -U /var/cache/pacman/pkg/$PACKAGE"
fi
