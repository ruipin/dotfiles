#########################################
# lib_update
# Author: Rui Pinheiro
#
# Library for basic build scripts

set -e

# Check setup
if [[ -z "$LOCAL_BUILD_FOLDER" ]]; then
	echo "Please define \$LOCAL_BUILD_FOLDER"
	exit -1
fi

# First parameter: Application name
#   - Used to generate build folder name
export UPD_APP="$1"
if [[ -z "$UPD_APP" ]]; then
  echo "No application name provided."
  exit -1
fi
export UPD_BUILD="$LOCAL_BUILD_FOLDER/$UPD_APP"
mkdir -p "$UPD_BUILD"

# Save current PWD
export OLD_PWD="$PWD"

# Clone from github repo and CD to repo root
# Usage: github_clone <repo> <ver>
# Version can be a ".tar.gz" file, in which case a release with the same name is downloaded
function github_clone {
  local repo="$1"
  local ver="$2"

  if [[ -z "$ver" ]]; then
    echo "No branch/version provided."
  fi

  local is_targz=0
  if [[ "$ver" == *".tar.gz" ]]; then
    is_targz=1
    ver="${ver%.tar.gz}"
    targz_clone "https://github.com/$repo/archive/$ver.tar.gz"
    return $?
  fi

  # Create destination
  local dest="$UPD_BUILD/$ver"
  echo "Destination folder: $dest"
  rm -Rf "$dest"
  mkdir "$dest"

  # Clone
  git clone -b "$ver" "$repo" -O "$dest"
  echo "Clone finished."

  # CD to repo (hack: assume its the only folder)
  cd "$dest"
  echo "Repo: $PWD"

  return 0
}

function targz_clone {
  local url="$1"
  local fname="${url##*/}"
  local ver="${fname%.tar.gz}"

  # Create destination
  local dest="$UPD_BUILD/$ver"
  echo "Destination folder: $dest"
  rm -Rf "$dest"
  mkdir "$dest"

  # Download and extract
  local targz="$dest/$ver.tar.gz"
  [[ -f "$targz" ]] && rm "$targz"
  wget --no-check-certificate "$url" -O "$targz"
  tar xf "$targz" -C "$dest"
  echo "Downloaded and extracted tar.gz file."

  # CD to root (assume only folder)
  cd "$dest/"*/
  echo "Repo: $PWD"

  return 0
}
