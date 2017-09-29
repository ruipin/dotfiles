#!/bin/bash

# Init
if [[ -z "$LOCAL_BUILD_FOLDER" ]]; then
	echo "Please define \$LOCAL_BUILD_FOLDER"
	return
fi

export app="zsh"

set -e
mkdir -p "$LOCAL_BUILD_FOLDER/$app"
cd "$LOCAL_BUILD_FOLDER/$app"


# Download + extract
if [[ ! -z "$USE_HEAD" ]]; then
   rm -Rf github
   mkdir github
   cd github
   git clone git://git.code.sf.net/p/zsh/code .
else
   zsh_version="5.4.2"
   rm -Rf zsh-*
   wget "https://github.com/zsh-users/zsh/archive/zsh-${zsh_version}.tar.gz" -O "zsh-${zsh_version}.tar.gz"
   tar xf "zsh-${zsh_version}.tar.gz"
   cd "zsh-zsh-${zsh_version}"
fi


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
