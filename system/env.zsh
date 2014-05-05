export EDITOR=/usr/bin/vim

if [ $(uname -s) = "Darwin" ]
then
    export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
fi

