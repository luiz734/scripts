#!/usr/bin/env bash

# removes an arch package

PKGNAME=$(yay -Q | cut -d " " -f 1 | gum filter)

if [ -n "$PKGNAME" ]; then
    yay -Rscn $PKGNAME
fi
