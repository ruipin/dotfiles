#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "libtermkey" --github "neovim/libtermkey" --ver "master" $@

# Build
make PREFIX="${LOCAL_PREFIX}"
make install PREFIX="${LOCAL_PREFIX}"
