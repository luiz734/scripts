#! /usr/bin/env bash

# list arch packages by FRIST install date

awk '/\[ALPM\] installed/ { print $(NF-1) }' /var/log/pacman.log | tac | gum choose --no-limit | tr '\n' ' ' | xclip -sel clip
