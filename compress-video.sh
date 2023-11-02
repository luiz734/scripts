#! /usr/bin/env bash

# compress a video in the current dir

VALID_EXTENSIONS="mp4"
OPTIONS=$(ls | grep -E "\.($VALID_EXTENSIONS)$")

if [ -n "$OPTIONS" ]; then
    # echo -e "$SOMETHING" will interpret escape characters
    # DON'T FORGET DOUBLE QUOTES
    VIDEO=$(echo -e "$OPTIONS" | gum filter --limit 1)
    
    if [ -n "$VIDEO" ]; then
        ffmpeg -i "$VIDEO" -vcodec libx265 -crf 28 "$VIDEO-compressed.mp4"
    fi
else
    echo "No files. Options are $(gum style --foreground 212 $VALID_EXTENSIONS)"
fi


