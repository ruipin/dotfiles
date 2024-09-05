#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "tmux" --github "tmux/tmux" --ver "3.4.tar.gz" $@


# Disable reflow functionality
sed -i -e "s~if (reflow)~if (0)~" screen.c


# Build
./autogen.sh
./configure --prefix="${LOCAL_PREFIX}"
make
make install



