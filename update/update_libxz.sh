#!/bin/bash

# Init
source lib_update.bash "libxz"
targz_clone "https://tukaani.org/xz/xz-5.2.3.tar.gz"

# Build
./autogen.sh
./configure --prefix=$LOCAL_PREFIX
make
make install
