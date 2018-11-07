#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "valgrind" --targz "http://www.valgrind.org/downloads/valgrind-3.14.0.tar.bz2" $@


# Build
./autogen.sh
./configure --prefix=$LOCAL_PREFIX
make
#make check
make install
