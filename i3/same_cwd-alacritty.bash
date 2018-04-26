#!/bin/bash

# Find out the CWD of the currently focused X window
# xcwd: https://github.com/schischi/xcwd
CWD=$(xcwd)

echo "$CWD"

# Open urxvt and cd to $CWD
alacritty --working-directory "$CWD"
