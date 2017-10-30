#!/bin/sh

# Removes group/others permissions from CWD
# Useful to make sure that others in the same machine (non-root) cannot access dotfiles folder

find . -type d -exec chmod u+rwx,g-rwx,o-rwx {} \;
find . -type f -exec chmod u+rw,g-rwx,o-rwx {} \;
find ./zsh -type f -exec chmod u-x {} \;
