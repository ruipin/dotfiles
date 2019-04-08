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

if [[ -z "$LOCAL_PREFIX" ]]; then
	echo "Please define \$LOCAL_PREFIX"
	exit -2
fi

# Save current PWD
export OLD_PWD="$PWD"

function clone {
  # First parameter: Application name
  #   - Used to generate build folder name
  export UPD_APP="$1"
  if [[ -z "$UPD_APP" ]]; then
    echo "No application name provided."
    exit -1
  fi
  export UPD_BUILD="$LOCAL_BUILD_FOLDER/$UPD_APP"
  mkdir -p "$UPD_BUILD"
  shift 1

  ###########################
  # Parse remaining params
  local has_func=0
  local func=""
  local repo=""
  local url=""
  local ver="master"
  local -a params
  while [[ "$#" -gt "0" ]]; do
    case "$1" in
    "-gh" | "--github")
      func="github"
      repo="$2"
      shift 2
      ;;
    "-v" | "--ver" | "--version")
      ver="$2"
      shift 2
      ;;
    "-t" | "--targz")
      func="targz"
      url="$2"
      shift 2
      ;;
    # Directory path
    *)
      echo "Unknown parameter '$1', aborting."
      exit 1
    esac
  done

  # Do clone
  if [[ "$func" == "github" ]]; then
    if [[ -z "$repo" || -z "$ver" ]]; then
      echo "Invalid parameter combination."
      exit
    fi

    github_clone "$repo" "$ver"
  elif [[ "$func" == "targz" ]]; then
    if [[ -z "$url" ]]; then
      echo "Invalid parameter combination."
      exit
    fi

    targz_clone "$url"
  else
    echo "Invalid \$func, aborting."
    exit
  fi
}

# Clone from github repo and CD to repo root
# Usage: github_clone <repo> <ver>
# Version can be a ".tar.gz" file, in which case a release with the same name is downloaded
function github_clone {
  local repo="$1"
  local ver="$2"

  if [[ -z "$ver" ]]; then
    echo "No branch/version provided."
    exit
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
  git clone -b "$ver" "ssh://git@github.com/$repo" "$dest"
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
