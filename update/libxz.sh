#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "libxz" --targz "https://tukaani.org/xz/xz-5.2.9.tar.gz" $@

# Build
./autogen.sh
./configure --prefix="$LOCAL_PREFIX"
make
make install
