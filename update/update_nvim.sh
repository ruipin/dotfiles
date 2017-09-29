#!/bin/bash

# Init
if [[ -z "$LOCAL_BUILD_FOLDER" ]]; then
	echo "Please define \$LOCAL_BUILD_FOLDER"
	return
fi

export app="neovim"

set -e
mkdir -p "$LOCAL_BUILD_FOLDER/$app"
cd "$LOCAL_BUILD_FOLDER/$app"


# Download + extract
if [[ ! -z "$USE_HEAD" ]]; then
   rm -Rf github
   mkdir github
   cd github
   git clone https://github.com/neovim/neovim.git .
else
   version="0.2.0"
   rm -Rf neovim-* nvim-*
   wget "https://github.com/neovim/neovim/archive/v${version}.tar.gz" -O "nvim-${version}.tar.gz"
   tar xf "nvim-${version}.tar.gz"
   cd "neovim-${version}"
fi


# Build
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=${LOCAL_PREFIX}" CMAKE_BUILD_TYPE=RelWithDebInfo 
make install
pip2 install --upgrade neovim
pip3 install --upgrade neovim