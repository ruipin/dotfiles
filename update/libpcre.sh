#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "libpcre" --github "vmg/libpcre" --ver "pcre-8.36.tar.gz" $@

# Build
./autogen.sh
./configure --prefix="$LOCAL_PREFIX" \
  --enable-pcre16 \
  --enable-pcre32 \
  --enable-jit \
  --enable-utf \
  --enable-unicode-properties
make
make install
