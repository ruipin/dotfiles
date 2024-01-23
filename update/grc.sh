#!/bin/bash

# Init
source "$(dirname $(readlink -f $0))/lib_update.bash"
clone "grc" --github "garabik/grc" --ver "devel" $@

BINDIR="$LOCAL_PREFIX/bin"
LIBDIR="$LOCAL_PREFIX/share/grc"
MANDIR="$LOCAL_PREFIX/share/man"
CONFDIR=~/.grc

mkdir -p "$BINDIR"
cp -fv grc grcat "$BINDIR"

mkdir -p "$LIBDIR"
cp -fv colourfiles/conf.* "$LIBDIR"

mkdir -p "$MANDIR/man1"
cp -fv grc.1   "$MANDIR/man1"
cp -fv grcat.1 "$MANDIR/man1"

if [[ ! -d "$CONFDIR" ]]; then
  mkdir -p "$CONFDIR"
  cat grc.conf | sed -e "s~conf\.~$LIBDIR/conf\.~" > "$CONFDIR/grc.conf"
  cp -fv grc.zsh  "$CONFDIR"
  cp -fv grc.fish "$CONFDIR"
  cp -fv grc.sh   "$CONFDIR"
fi

mkdir -p "$LOCAL_PREFIX/share/zsh/site-functions"
cp -fv _grc "$LOCAL_PREFIX/share/zsh/site-functions"

echo "Done."
