#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "vim" --github "vim/vim" --ver "master" $@


# Build
./configure --with-features=huge --enable-multibyte --enable-rubyinterp \
   --enable-largefile --enable-pythoninterp --with-x \
   --with-python-config-dir="${LOCAL_PREFIX}/lib/python2.7/config" \
   --enable-python3interp --with-python3-config-dir="${LOCAL_PREFIX}/lib/python3.5/config" \
   --enable-perlinterp --enable-luainterp --with-luajit --enable-fail-if-missing \
   --enable-cscope --prefix="${LOCAL_PREFIX}"
make VIMRUNTIMEDIR="${LOCAL_PREFIX}/share/vim/vim74"
make install
