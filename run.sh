#!/usr/bin/env bash

# shows a list of scripts to run in a preconfigured dir

# not necessary anymore. Added to .zshrc
# SCRIPTS_DIR="$HOME/scripts"

# only files with this extensions will be shown
VALID_EXTENSIONS="lua|sh"

# get all the scripts in the configured directory, filtering out invalid extensions
OPTIONS=$(ls $SCRIPTS_DIR | grep -E "\.($VALID_EXTENSIONS)$")

# get the name of the script inside picked by the user
SCRIPT=$(echo -e "$OPTIONS" | gum filter --limit 1)

if [ -n "$SCRIPT" ]; then
    # the full path of the script
    FULL_PATH="$SCRIPTS_DIR/$SCRIPT"
    
    # run it
    eval "$FULL_PATH"
fi
