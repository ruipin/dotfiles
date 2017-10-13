#########################################
# local_prefix.zsh
# Author: Rui Pinheiro
#
# Sets up a local prefix folder


# Do nothing is no local prefix is defined
if [[ -z "$LOCAL_PREFIX" ]]; then
	return
fi

###############
# Set up local prefix

# Add local usr folder to path
env_prepend PATH "${LOCAL_PREFIX}/bin"

# Add local lib folder to library path
env_prepend LD_LIBRARY_PATH "${LOCAL_PREFIX}/lib64:${LOCAL_PREFIX}/lib"
env_prepend LIBRARY_PATH "${LOCAL_PREFIX}/lib64:${LOCAL_PREFIX}/lib"

env_append PKG_CONFIG_PATH "${LOCAL_PREFIX}/lib/pkgconfig"

# Add local include path to CPATH
env_prepend CPATH "${LOCAL_PREFIX}/include"
env_prepend C_INCLUDE_PATH "${LOCAL_PREFIX}/include"
env_prepend CPLUS_INCLUDE_PATH "${LOCAL_PREFIX}/include"

# Add local docs to man paths
env_prepend MANPATH "${LOCAL_PREFIX}/share/man"
env_prepend INFOPATH "${LOCAL_PREFIX}/share/man"

# LUA override
#export LUA_PREFIX="${LOCAL_PREFIX}"
