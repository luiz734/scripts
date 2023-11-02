#!/usr/bin/env bash

# switch between godot versions

GODOT_DIR="$HOME/.local/bin"
# -p appends a / in directories an grep -v / filter them out
GODOT_TARGET=$(ls -p $GODOT_DIR | grep -v / | grep -E '^Godot' | gum filter --limit 1)

eval $(ln -fs $GODOT_DIR/$GODOT_TARGET $GODOT_DIR/godot)

