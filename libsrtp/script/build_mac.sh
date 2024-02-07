#!/bin/sh

BUILDPATH="$PWD/../build/mac"
INSTALLPATH="$PWD/../install/mac"
OPENSSLPATH="$PWD/../../openssl/install/mac"

cd ../src

rm -r $INSTALLPATH
rm -r $BUILDPATH

cmake -S . -B $BUILDPATH \
  -DCMAKE_BUILD_TYPE=release \
  -DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=$OPENSSLPATH/include \
  -DOPENSSL_CRYPTO_LIBRARY=$OPENSSLPATH/lib/libcrypto.a \
  -DBUILD_SHARED_LIBS=OFF -DBUILD_WITH_WARNINGS=OFF
cmake --build $BUILDPATH --clean-first --config release --target all -- -j8
cmake --install $BUILDPATH --prefix $INSTALLPATH --config release
