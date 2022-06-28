#!/bin/bash

#设置NDK路径
export NDK=/mnt/e/code/android/ndk/android-ndk-r21d-linux
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64

function build_android {
  ./configure \
    --prefix=$PREFIX \
    --enable-postproc --enable-gpl --enable-static --disable-shared --disable-debug --disable-asm \
    --cross-prefix=$CROSS_PREFIX \
    --target-os=android \
    --arch=$ARCH \
    --cpu=$CPU \
    --cc=$CC \
    --cxx=$CXX \
    --sysroot=$SYSROOT \
    --extra-cflags="-Os -fpic $OPTIMIZE_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS"

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
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfp -marm -march=$CPU"

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
OPTIMIZE_CFLAGS="-march=$CPU"

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
OPTIMIZE_CFLAGS="-march=i686 -mtune=intel -mssse3 -mfpmath=sse -m32"

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
OPTIMIZE_CFLAGS="-march=$CPU -msse4.2 -mpopcnt -m64 -mtune=intel"

echo "============================ start build x86_64 =========================="
build_android
