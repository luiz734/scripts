#!/usr/bin/env bash

## WHAT IT DOES?
# Initialize a basic lua project
#   setup vscode launch.json for debug
#   install modules and create file to track dependencies
#   initialize Lua enviroment variables in .envrc
#   create src/main.lua
#   initialize git repository

## THIS IS NOT A COMPLETE GUIDE
# You have to understand the source code
# It's a good ideia learn how gum works before changing anything
# Add the "run.sh" script to the PATH make your life easier

## DEPENDENCIES
# gum
# xargs
# lua
# luarocks
# direnv
# git

## HOW TO SETUP
#
# enviroment variables
#   SCRIPTS_DIR="path/to/scripts/dir"
#
# SCRIPTS_DIR
#   generate-vscode-lua-path.lua
#   lua-launch-json.sh
#
# SCRIPTS_DIR/templates
#   lua-gitignore
#   lua-launch.json
#   lua-main.lua

# customize here
DEFAULT_DEPENDENCIES="argparse"
DEPENDENCIES_FILE="dependencies.txt"
MODULES_DIR="modules"
LAUNCH_VSCODE=$(true)


clear
PROJECT_NAME=$(gum input --prompt "Project name: " --placeholder "MyProject" --prompt.foreground 212 --cursor.foreground 99 --width 50)
if [ -z $PROJECT_NAME ]; then
    echo "Project name can't be empty"
    exit
fi

# create dir if not exits
if ! [ -d "$PROJECT_NAME" ]; then
    mkdir $PROJECT_NAME
fi

# check if it is empty
if ! [ -z "$(ls -A $PROJECT_NAME)" ]; then
    echo "Directory $PROJECT_NAME not empty"
    exit
fi

# ask for dependencies
DEPS=$(gum input --prompt "Dependencies: " --value "$DEFAULT_DEPENDENCIES " --prompt.foreground 212)

# version control
VERSION_CONTROL=$(gum confirm "Add version control?" && echo y)

cd $PROJECT_NAME
eval "$SCRIPTS_DIR/lua-launch-json.sh"

# create dependency file and install dependencies
# if a dependency not exists, will not be installed but still will be in the file
touch $DEPENDENCIES_FILE
echo "$DEPS" | xargs -d " " -I {} echo -e "{}" > $DEPENDENCIES_FILE
mkdir $MODULES_DIR
cat $DEPENDENCIES_FILE | xargs -I {} luarocks --tree $MODULES_DIR install {}

mkdir src
LUA_MAIN_TEMPLATE="$SCRIPTS_DIR/templates/lua-main.lua"
cp $LUA_MAIN_TEMPLATE src/main.lua

# generate enviroment Lua variables
luarocks --tree $MODULES_DIR path > .envrc && direnv allow

# copy the output to launch.json
LAUNCH_JSON=".vscode/launch.json"

# generate vscode json content for path and cpath
PATH_AND_CPATH=$($SCRIPTS_DIR/generate-vscode-lua-path.lua)
# replace the template with the generated content
{ head -n 10 $LAUNCH_JSON; echo -e "$PATH_AND_CPATH"; tail -n +13 $LAUNCH_JSON; } > temp && mv temp $LAUNCH_JSON

# init the git repo
if ! [ -z "$VERSION_CONTROL" ]; then
    git init
    LUA_IGNORE_TEMPLATE="$SCRIPTS_DIR/templates/lua-gitignore"
    cp $LUA_IGNORE_TEMPLATE ./.gitignore &&
    git add . && git commit -m "First commit"
fi

# launch vscode
if $LAUNCH_VSCODE ; then
    code . src/main.lua
fi