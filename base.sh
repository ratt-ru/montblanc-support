SOURCE_PREFIX=$HOME/src
INSTALL_PREFIX=$HOME/usr

# Adaptation of http://superuser.com/a/39995
# Usage: PATH = $(prepend_to_path $PATH /tmp)
# $1 is the existing path variable
# $2 is the directory to prepend
# Checks that $2 is a directory and exists
# before prepending to the path
prepend_to_path() {
    if [ -d "$2" ] && [[ ":$1:" != *":$2:"* ]]; then
        echo "$2${1:+":$1"}"
    fi
}

PATH=$(prepend_to_path $PATH $INSTALL_PREFIX/bin)
LD_LIBRARY_PATH=$(prepend_to_path $LD_LIBRARY_PATH  $INSTALL_PREFIX/lib)
LIBRARY_PATH=$(prepend_to_path $LIBRARY_PATH $LIBRARY_PATH/lib)
CPLUS_INCLUDE_PATH=$(prepend_to_path $CPLUS_INCLUDE_PATH $INSTALL_PREFIX/include)
C_INCLUDE_PATH=$(prepend_to_path $C_INCLUDE_PATH $INSTALL_PREFIX/include)

PYTHONHOME=$INSTALL_PREFIX
PYTHONPATH=$(prepend_to_path $PYTHONPATH $INSTALL_PREFIX/lib/python2.7)
