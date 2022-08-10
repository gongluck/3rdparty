#!/bin/sh

export ANDROID_NDK_ROOT=/mnt/e/code/android/ndk/android-ndk-r21d-linux
PATH=$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

abi=22

cd ../src

# android-arm
make clean
platform=android-arm
./Configure $platform -D__ANDROID_API__=$abi --prefix=$PWD/../install/$platform
make -j 8
make install

# android-arm64
make clean
platform=android-arm64
./Configure $platform -D__ANDROID_API__=$abi --prefix=$PWD/../install/$platform
make -j 8
make install

# android-x86
make clean
platform=android-x86
./Configure $platform -D__ANDROID_API__=$abi --prefix=$PWD/../install/$platform
make -j 8
make install

# android-x86_64
make clean
platform=android-x86_64
./Configure $platform -D__ANDROID_API__=$abi --prefix=$PWD/../install/$platform
make -j 8
make install
