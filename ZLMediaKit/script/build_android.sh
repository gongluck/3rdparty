#!/bin/sh

export ANDROID_NDK_ROOT=/mnt/e/code/android-ndk-r21-linux

platform=android-22
# armeabi-v7a arm64-v8a x86 x86_64
abi=armeabi-v7a

BUILDPATH="$PWD/../build/android/$platform/$abi"
INSTALLPATH="$PWD/../install/android/$platform/$abi"
OPENSSLPATH="$PWD/../../openssl/install/android/android-arm"
SRTPPATH="$PWD/../../libsrtp/install/android/$platform/$abi"
SCTPPATH="$PWD/../../usrsctp/install/android/$platform/$abi"

buildparams="-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake -DCMAKE_MAKE_PROGRAM=$ANDROID_NDK_ROOT/prebuilt/linux-x86_64/bin/make -DANDROID_NDK=$ANDROID_NDK_ROOT"

cd ../src && git submodule update --init && cd ../script && cd ../src

rm -r $INSTALLPATH
rm -r $BUILDPATH

cmake -G "Unix Makefiles" -S . -B $BUILDPATH $buildparams -DCMAKE_INSTALL_PREFIX=$INSTALLPATH \
    -DCMAKE_BUILD_TYPE=release -DANDROID_ABI=$abi -DANDROID_PLATFORM=$platform \
    -DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=$OPENSSLPATH/include -DOPENSSL_SSL_LIBRARY=$OPENSSLPATH/lib/libssl.a -DOPENSSL_CRYPTO_LIBRARY=$OPENSSLPATH/lib/libcrypto.a \
    -DSRTP_INCLUDE_DIRS=$SRTPPATH/include -DSRTP_LIBRARIES=$SRTPPATH/lib/libusrsctp.a \
    -DSCTP_INCLUDE_DIRS=$SCTPPATH/include -DSCTP_LIBRARIES=$SCTPPATH/lib/libusrsctp.a \
    -DENABLE_WEBRTC=ON -DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build $BUILDPATH --clean-first --config release --target all -- -j8
cmake --install $BUILDPATH --config release --prefix $INSTALLPATH
cp -r ./release/android/release/*.a $INSTALLPATH/lib/
cp -r ./release/android/release/*.so $INSTALLPATH/bin/
