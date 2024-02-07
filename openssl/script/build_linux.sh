#!/bin/sh

cd ../src

./config --prefix=$PWD/../install/linux
make -j 8
make install
./config -tmake depend
# cd ../install/linux
# ln -s openssl ssl
