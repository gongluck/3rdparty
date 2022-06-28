#!/bin/bash

cd ../src
make clean
./configure --enable-postproc --enable-gpl --prefix=$(pwd)/linux/ --disable-shared --enable-static --disable-debug --disable-asm
make -j 8
make install