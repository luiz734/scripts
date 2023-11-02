#!/usr/bin/env bash
TEMPLATES_DIR="${SCRIPTS_DIR}/templates"

# creates a launch.json for lua using the template

SOURCE="${TEMPLATES_DIR}/lua-launch.json"
DEST=".vscode/launch.json"

echo "$SOURCE $DEST"

function copy_file() {
    gum spin --spinner line --title "Copying launch.json" -- sleep 0.8
    cp $SOURCE $DEST
}

# if dir not exists, create one
if ! [ -d ".vscode" ]; then
    mkdir .vscode
fi

# if file exists, ask for overwrite
if [ -e "$DEST" ]; then
    gum confirm "\"launch.json\" exists. Overwrite?" && $(copy_file)
else
    copy_file
fi

