#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "sed" -t "http://ftp.gnu.org/gnu/sed/sed-4.9.tar.gz" "$@"


# Build
./configure --prefix="${LOCAL_PREFIX}"
make
make install
