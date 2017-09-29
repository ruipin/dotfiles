#!/bin/bash

# Init
if [[ -z "$LOCAL_BUILD_FOLDER" ]]; then
	echo "Please define \$LOCAL_BUILD_FOLDER"
	return
fi

export app="vim"

set -e
mkdir -p "$LOCAL_BUILD_FOLDER/$app"
cd "$LOCAL_BUILD_FOLDER/$app"


# Download + extract
set -e
mkdir -p vim
cd vim
rm -Rf github
mkdir github
cd github
git clone https://github.com/vim/vim .


# Build
./configure --with-features=huge --enable-multibyte --enable-rubyinterp \
   --enable-largefile --enable-pythoninterp --with-x \
   --with-python-config-dir=${LOCAL_PREFIX}/lib/python2.7/config \
   --enable-python3interp --with-python3-config-dir=${LOCAL_PREFIX}/lib/python3.5/config \
   --enable-perlinterp --enable-luainterp --with-luajit --enable-fail-if-missing \
   --enable-cscope --prefix=${LOCAL_PREFIX}
make VIMRUNTIMEDIR=${LOCAL_PREFIX}/share/vim/vim74
make install
