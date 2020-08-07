#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "libevent" --github "libevent/libevent" --ver "release-2.1.12-stable.tar.gz" $@

# Build
./autogen.sh
./configure --prefix="$LOCAL_PREFIX"
make
make install
