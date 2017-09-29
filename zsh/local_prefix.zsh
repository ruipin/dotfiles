#########################################
# local_prefix.zsh
# Author: Rui Pinheiro
#
# Sets up a local prefix folder


# Do nothing is no local prefix is defined
if [[ -z "$LOCAL_PREFIX" ]]; then
	return
fi


# Set up local prefix
# TODO: Make sure we have all the environment variables
env_prepend PATH "$LOCAL_PREFIX/bin"
env_prepend LD_LIBRARY_PATH "$LOCAL_PREFIX/lib"
