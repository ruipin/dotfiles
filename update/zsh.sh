#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "zsh" --github "zsh-users/zsh" --ver "zsh-5.9.tar.gz" $@


# Build
./Util/preconfig
./configure --prefix="$LOCAL_PREFIX" \
   --exec-prefix="$LOCAL_PREFIX" \
   --enable-multibyte \
   --with-term-lib="ncursesw tinfo" \
   --enable-zsh-mem \
   --enable-largefile \
   --enable-cap \
   --with-tcsetpgrp \
   --enable-readnullcmd=pager \
   --enable-multibyte
   #--enable-pcre
make
#make check
make install
