#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "valgrind" --targz "https://sourceware.org/pub/valgrind/valgrind-3.18.1.tar.bz2" $@


# Build
./autogen.sh
./configure --prefix="$LOCAL_PREFIX"
make
#make check
make install
