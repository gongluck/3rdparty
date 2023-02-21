rm -r ../build/apple/*
rm -r ../install/apple/*
mkdir ../build/apple
mkdir ../install/apple

# params: type(iOS_shared) system(iOS) arch("armv7;arm64;i386;x86_64") build_shared_libs(ON)
function build {
  cmake -S ../src -B ../build/apple/$1 -G Xcode \
    -DCMAKE_SYSTEM_NAME=$2 \
    -DCMAKE_OSX_ARCHITECTURES=$3 \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=9.0 \
    -DCMAKE_INSTALL_PREFIX=`pwd`/../install/apple/$1 \
    -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=NO \
    -DCMAKE_IOS_INSTALL_COMBINED=YES \
    -DCMAKE_XCODE_ATTRIBUTE_ENABLE_BITCODE=NO \
    -DBUILD_SHARED_LIBS=$4
  cmake --build ../build/apple/$1 --clean-first --target ALL_BUILD --config Release
  cmake --install ../build/apple/$1 --config Release --prefix `pwd`/../install/apple/$1
}

build iOS_shared iOS "armv7;arm64;i386;x86_64" ON
build iOS_static iOS "armv7;arm64;i386;x86_64" OFF