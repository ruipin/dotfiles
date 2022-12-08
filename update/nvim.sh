#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "neovim" --github "neovim/neovim" --ver "v0.8.1" $@

# Build
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=${LOCAL_PREFIX}" CMAKE_BUILD_TYPE=RelWithDebInfo 
make install
#pip2 install --upgrade neovim
#pip3 install --upgrade neovim

echo "Remember to update pip2/3 neovim: pipN install --upgrade neovim"
