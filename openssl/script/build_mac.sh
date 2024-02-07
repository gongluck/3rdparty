#!/bin/sh

cd ../src

rm -r $PWD/../install/mac
./config --prefix=$PWD/../install/mac
make -j 8
make install
