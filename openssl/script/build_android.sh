#!/bin/sh

export ANDROID_NDK_ROOT=/mnt/e/code/android/ndk/android-ndk-r21d-linux
PATH=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

ABI=22

cd ../src

# android-arm
make clean
./Configure android-arm -D__ANDROID_API__=$ABI --prefix=$PWD/../install/android-arm
make -j 8
make install

# android-arm64
make clean
./Configure android-arm64 -D__ANDROID_API__=$ABI --prefix=$PWD/../install/android-arm64
make -j 8
make install

# android-x86
make clean
./Configure android-x86 -D__ANDROID_API__=$ABI --prefix=$PWD/../install/android-x86
make -j 8
make install

# android-x86_64
make clean
./Configure android-x86_64 -D__ANDROID_API__=$ABI --prefix=$PWD/../install/android-x86_64
make -j 8
make install
