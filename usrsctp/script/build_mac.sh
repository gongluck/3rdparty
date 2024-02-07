#!/bin/sh

BUILDPATH="$PWD/../build/mac"
INSTALLPATH="$PWD/../install/mac"

cd ../src

rm -r $INSTALLPATH
rm -r $BUILDPATH

cmake -S . -B $BUILDPATH \
  -DCMAKE_BUILD_TYPE=release \
  -Dsctp_werror=0 -Dsctp_inet=0 -Dsctp_inet6=0 -Dsctp_build_programs=0
cmake --build $BUILDPATH --clean-first --config release --target all -- -j8
cmake --install $BUILDPATH --prefix $INSTALLPATH --config release
