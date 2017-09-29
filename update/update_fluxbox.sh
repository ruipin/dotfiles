#!/bin/bash
echo "Note: Requires gcc 6.2.0 (or another recent version)"

# Init
if [[ -z "$LOCAL_BUILD_FOLDER" ]]; then
	echo "Please define \$LOCAL_BUILD_FOLDER"
	return
fi

export app="fluxbox"

set -e
mkdir -p "$LOCAL_BUILD_FOLDER/$app"
cd "$LOCAL_BUILD_FOLDER/$app"


# Download + extract
if [[ ! -z "$USE_HEAD" ]]; then
   rm -Rf github
   mkdir github
   cd github
   git clone "https://github.com/fluxbox/fluxbox.git" .
   ./autogen.sh
else
   fluxbox_version="1_3_7"
   rm -Rf fluxbox-*
   wget "https://github.com/fluxbox/fluxbox/archive/Release-${fluxbox_version}.tar.gz" -O "fluxbox-${fluxbox_version}.tar.gz"
   tar xf "fluxbox-${fluxbox_version}.tar.gz"
   cd "fluxbox-${fluxbox_version}"
fi


# Patch + Build
sed -i -e "s~m_bevel + m_left_padding + m_right_padding + textwidth()~m_bevel + m_left_padding + m_right_padding + textwidth()~" src/FbTk/TextButton.cc
./configure --prefix=$LOCAL_PREFIX
make
make install