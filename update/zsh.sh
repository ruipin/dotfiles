#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "vim" --github "zsh-users/zsh" --ver "zsh-5.4.2.tar.gz" $@


# Build
./Util/preconfig
./configure --prefix=$LOCAL_PREFIX \
   --exec-prefix=$LOCAL_PREFIX \
   --enable-multibyte \
   --with-term-lib="ncursesw tinfo" \
   --enable-zsh-mem \
   --enable-largefile \
   --enable-cap \
   --with-tcsetpgrp \
   --enable-pcre \
   --enable-readnullcmd=pager \
   --enable-multibyte
make
#make check
make install
