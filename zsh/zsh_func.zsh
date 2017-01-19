#########################################
# zsh_func
# Author: Rui Pinheiro
#
# Defines multiple useful shell functions

#############
# Make directory and enter it
function mkcd {
   mkdir -p "$*" && cd "$*"
}

#############
# Recursive sed
function recsed {
   find "$1" -type f -exec \
      sed -i ${@:2} {} +
}

#############
# Tar on multiple files
# Can be used exactly like tar, but with wildcard support
# Note: Any parameter that is a valid, existing file will be assumed to be a file you want to extract
function tarall {

   # Parse parameters
   local params=("$1")
   local files=()
   local retval

   shift

   while [[ "$#" -gt "0" ]]; do
      if [[ -f "$1" ]]; then
         files+=("$1")
      else
         params+=("$1")
      fi
      shift
   done

   for file in $files; do
      tar $params "$file"
   done
}
