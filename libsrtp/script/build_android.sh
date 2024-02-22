#!/bin/sh

export ANDROID_NDK_ROOT=/mnt/e/code/android-ndk-r21-linux

platform=android-22
# armeabi-v7a arm64-v8a x86 x86_64
abi=armeabi-v7a

BUILDPATH="$PWD/../build/android/$platform/$abi"
INSTALLPATH="$PWD/../install/android/$platform/$abi"
OPENSSLPATH="$PWD/../../openssl/install/android/android-arm"

buildparams="-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake -DCMAKE_MAKE_PROGRAM=$ANDROID_NDK_ROOT/prebuilt/linux-x86_64/bin/make -DANDROID_NDK=$ANDROID_NDK_ROOT"

cd ../src

rm -r $INSTALLPATH
rm -r $BUILDPATH

cmake -G "Unix Makefiles" -S . -B $BUILDPATH $buildparams \
  -DCMAKE_BUILD_TYPE=release -DANDROID_ABI=$abi -DANDROID_PLATFORM=$platform \
  -DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=$OPENSSLPATH/include \
  -DOPENSSL_CRYPTO_LIBRARY=$OPENSSLPATH/lib/libcrypto.a \
  -DBUILD_SHARED_LIBS=OFF -DBUILD_WITH_WARNINGS=OFF
cmake --build $BUILDPATH --clean-first --config release --target all -- -j8
cmake --install $BUILDPATH --config release --prefix $INSTALLPATH
