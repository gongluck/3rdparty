#!/bin/sh

BUILDPATH="$PWD/../build/mac"
INSTALLPATH="$PWD/../install/mac"
OPENSSLPATH="$PWD/../../openssl/install/mac"
SRTPPATH="$PWD/../../libsrtp/install/mac"
SCTPPATH="$PWD/../../usrsctp/install/mac"

rm -r $INSTALLPATH
rm -r $BUILDPATH

cd ../src

git submodule update --init

cd ../src

cmake -S . -B $BUILDPATH \
  -DCMAKE_BUILD_TYPE=release \
  -DCMAKE_INSTALL_PREFIX=$INSTALLPATH \
  -DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=$OPENSSLPATH/include \
  -DOPENSSL_SSL_LIBRARY=$OPENSSLPATH/lib/libssl.a -DOPENSSL_CRYPTO_LIBRARY=$OPENSSLPATH/lib/libcrypto.a \
  -DSRTP_INCLUDE_DIRS=$SRTPPATH/include -DSRTP_LIBRARIES=$SRTPPATH/lib/libsrtp2.a \
  -DSCTP_INCLUDE_DIRS=$SCTPPATH/include -DSCTP_LIBRARIES=$SCTPPATH/lib/libusrsctp.a \
  -DENABLE_WEBRTC=ON -DENABLE_CXX_API=ON -DENABLE_API_STATIC_LIB=ON
cmake --build $BUILDPATH --clean-first --config release --target all -- -j8
cmake --install $BUILDPATH --prefix $INSTALLPATH --config release
