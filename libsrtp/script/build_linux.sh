#!/bin/sh

rm -r ../build/linux
mkdir ../build/linux

cmake -S ../src -B ../build/linux/ \
  -DCMAKE_BUILD_TYPE=release \
  -DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/linux/ \
  -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/linux/libcrypto.a \
  -DBUILD_SHARED_LIBS=OFF -DBUILD_WITH_WARNINGS=OFF
cmake --build ../build/linux/ --clean-first --config release --target all -- -j8
cmake --install ../build/linux/ --config release --prefix ../install/linux
