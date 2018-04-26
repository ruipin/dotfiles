#!/bin/bash

# Find out the CWD of the currently focused X window
# xcwd: https://github.com/schischi/xcwd
CWD=$(xcwd)

# Open xterm and cd to $CWD
xterm -e "cd \"$CWD\"; $SHELL"
