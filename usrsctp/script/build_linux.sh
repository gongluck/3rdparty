#!/bin/sh

rm -r ../build/linux
mkdir ../build/linux

cmake -S ../src -B ../build/linux -DCMAKE_BUILD_TYPE=release -Dsctp_werror=0 -Dsctp_inet=0 -Dsctp_inet6=0 -Dsctp_build_programs=0
cmake --build ../build/linux --clean-first --config release --target all -- -j8
cmake --install ../build/linux --config release --prefix ../install/linux
