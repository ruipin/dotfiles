#!/bin/bash

# Init
source lib_update.bash "ag"
github_clone "ggreer/the_silver_searcher" "2.1.0.tar.gz"

# Build
./autogen.sh
./configure --prefix=$LOCAL_PREFIX
make
make install
