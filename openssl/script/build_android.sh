#!/bin/sh

export ANDROID_NDK_ROOT=/mnt/e/code/android-ndk-r21-linux
PATH=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

# android-arm android-arm64 android-x86 android-x86_64
platform=android-arm
abi=22

BUILDPATH="$PWD/../build/android/$platform"
INSTALLPATH="$PWD/../install/android/$platform"

cd ../src

rm -r $INSTALLPATH
rm -r $BUILDPATH

make clean

./Configure $platform -D__ANDROID_API__=$abi --prefix=$INSTALLPATH
make -j 8
make install
