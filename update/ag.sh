#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "ag" --github "ggreer/the_silver_searcher" --ver "2.2.0.tar.gz" $@

# Build
./autogen.sh
./configure --prefix="$LOCAL_PREFIX"
make
make install
