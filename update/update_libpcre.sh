#!/bin/bash

# Init
source lib_update.bash "libpcre"
github_clone "vmg/libpcre" "pcre-8.36.tar.gz"

# Build
./autogen.sh
./configure --prefix=$LOCAL_PREFIX \
  --enable-pcre16 \
  --enable-pcre32 \
  --enable-jit \
  --enable-utf \
  --enable-unicode-properties
make
make install
