#!/bin/bash
echo "Note: Requires gcc 6.2.0 (or another recent version)"

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "fluxbox" --github "fluxbox/fluxbox" --ver "Release-1_3_7.tar.gz" $@


# Patch + Build
sed -i -e "s~m_bevel + m_left_padding + m_right_padding + textwidth()~m_bevel + m_left_padding + m_right_padding + textwidth()~" src/FbTk/TextButton.cc
./configure --prefix="$LOCAL_PREFIX"
make
make install
