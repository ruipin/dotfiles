#!/bin/bash

# Init
if [[ -z "$LOCAL_BUILD_FOLDER" ]]; then
	echo "Please define \$LOCAL_BUILD_FOLDER"
	return
fi

export app="tmux"

set -e
mkdir -p "$LOCAL_BUILD_FOLDER/$app"
cd "$LOCAL_BUILD_FOLDER/$app"


# Download + extract
if [[ ! -z "$USE_HEAD" ]]; then
   rm -Rf github
   mkdir github
   cd github
   git clone https://github.com/tmux/tmux.git .
   sh autogen.sh
else
   rm -Rf zsh-*
   wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz -O tmux-2.5.tar.gz
   tar xf tmux-2.5.tar.gz
   cd tmux-2.5
fi


# Disable reflow functionality
sed -i -e "s~if (reflow)~if (0)~" screen.c


# Build
./configure --prefix=${LOCAL_PREFIX}
make
make install



