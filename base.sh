export SOURCE_PREFIX=$HOME/src
export INSTALL_PREFIX=$HOME/usr
export VENV_PREFIX=$HOME/venv

# Adaptation of http://superuser.com/a/39995
# Usage: PATH = $(prepend_to_path $PATH /tmp)
# $1 is the existing path variable
# $2 is the directory to prepend
# Checks that $2 is a directory and exists
# before prepending to the path
prepend_to_path() {
    # Handle 0 arguments
    if [ "$#" -eq 0 ]; then
        return
    fi

    # Handle 1 argument, this might occur if
    # the existing path variable is empty
    if [ "$#" -eq 1 ]; then
        echo $1
        return
    fi

    # If the supplied directory exists
    # prepend it to the path variable
    if [ -d "$2" ]; then
        echo "$2${1:+":$1"}"
    fi
}

export PATH=$(prepend_to_path $PATH $INSTALL_PREFIX/bin)
export LD_LIBRARY_PATH=$(prepend_to_path $LD_LIBRARY_PATH $INSTALL_PREFIX/lib)
export LD_LIBRARY_PATH=$(prepend_to_path $LD_LIBRARY_PATH $INSTALL_PREFIX/lib64)
export LIBRARY_PATH=$(prepend_to_path $LIBRARY_PATH $INSTALL_PREFIX/lib)
export LIBRARY_PATH=$(prepend_to_path $LIBRARY_PATH $INSTALL_PREFIX/lib64)
export CPLUS_INCLUDE_PATH=$(prepend_to_path $CPLUS_INCLUDE_PATH $INSTALL_PREFIX/include)
export C_INCLUDE_PATH=$(prepend_to_path $C_INCLUDE_PATH $INSTALL_PREFIX/include)
export PKG_CONFIG_PATH=$(prepend_to_path PKG_CONFIG_PATH $INSTALL_PREFIX/lib/pkgconfig)

export PYTHONHOME=$INSTALL_PREFIX
export PYTHONPATH=$(prepend_to_path $PYTHONPATH $INSTALL_PREFIX/lib/python2.7)
