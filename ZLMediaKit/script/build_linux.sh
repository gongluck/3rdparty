#!/bin/sh

rm -r ../build/linux
mkdir ../build/linux

# $1 config type
build() {
  cmake -S ../src -B ../build/linux/$1 -DCMAKE_INSTALL_PREFIX=../install/linux/$1 \
    -DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include \
    -DOPENSSL_SSL_LIBRARY=../../openssl/lib/linux/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/linux/libcrypto.a \
    -DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/linux/libsrtp2.a \
    -DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/linux/libusrsctp.a \
    -DENABLE_WEBRTC=ON -DENABLE_CXX_API=ON -DENABLE_API_STATIC_LIB=ON -DCMAKE_BUILD_TYPE=$1
  cmake --build ../build/linux/$1 --clean-first --config $1 --target all -- -j8
  cmake --install ../build/linux/$1 --prefix ../install/linux/$1 --config $1
  cp -r ../src/release/linux/$1/* ../install/linux/$1/lib/
  return 0
}

build debug
build release
