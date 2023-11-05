#! /usr/bin/env bash

# Recursively counts the occurrences of a given pattern in the current directory and its subdirectories.

PATTERN=$(gum input --prompt "Pattern: " --placeholder "*.png" --prompt.foreground 212 --width 50)

if [ -z "$PATTERN" ]; then
    gum style --foreground 240 "Defaulting to \"*\""
    PATTERN="*"
fi

find . -type f -name "$PATTERN" | wc -l

