#!/bin/bash

sudo apt-get -y install automake autoconf
#cd ../src/
autoconf

#设置NDK路径
export NDK=/mnt/e/code/android/ndk/android-ndk-r21d-linux
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64

function build_android {
  ./configure \
    --prefix=$PREFIX \
    --without-mp4v2 --enable-static --disable-shared \
    --without-mp4v2 --enable-static --disable-shared --host=arm-linux

  make clean
  make -j16
  make install

  echo "============================ build android success =========================="
}

#armv7-a
ARCH=arm
CPU=armv7-a
API=22
CC=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
CXX=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++
SYSROOT=$NDK/toolchains/llvm/prebuilt/linux-x86_64/sysroot
CROSS_PREFIX=$TOOLCHAIN/bin/arm-linux-androideabi-
PREFIX=$(pwd)/android/armeabi-v7a

echo "============================ start build armeabi-v7a=========================="
build_android

#armv8-a
ARCH=arm64
CPU=armv8-a
API=22
CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
SYSROOT=$NDK/toolchains/llvm/prebuilt/linux-x86_64/sysroot
CROSS_PREFIX=$TOOLCHAIN/bin/aarch64-linux-android-
PREFIX=$(pwd)/android/arm64-v8a

echo "============================ start build arm64-v8a =========================="
build_android

#x86
ARCH=x86
CPU=x86
API=22
CC=$TOOLCHAIN/bin/i686-linux-android$API-clang
CXX=$TOOLCHAIN/bin/i686-linux-android$API-clang++
SYSROOT=$NDK/toolchains/llvm/prebuilt/linux-x86_64/sysroot
CROSS_PREFIX=$TOOLCHAIN/bin/i686-linux-android-
PREFIX=$(pwd)/android/x86

echo "============================ start build x86 =========================="
build_android

#x86_64
ARCH=x86_64
CPU=x86-64
API=22
CC=$TOOLCHAIN/bin/x86_64-linux-android$API-clang
CXX=$TOOLCHAIN/bin/x86_64-linux-android$API-clang++
SYSROOT=$NDK/toolchains/llvm/prebuilt/linux-x86_64/sysroot
CROSS_PREFIX=$TOOLCHAIN/bin/x86_64-linux-android-
PREFIX=$(pwd)/android/x86_64

echo "============================ start build x86_64 =========================="
build_android
