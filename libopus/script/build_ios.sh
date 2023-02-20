rm -r ../build/ios
rm -r ../install/ios

cmake -S ../src -B ../build/ios -G Xcode -DENABLE_BITCODE=NO \
  -DCMAKE_TOOLCHAIN_FILE=../../ios-cmake/ios.toolchain.cmake -DPLATFORM=OS64 \
  -DBUILD_SHARED_LIBS=OFF
cmake --build ../build/ios --clean-first --target ALL_BUILD --config Release
cmake --install ../build/ios --config release --prefix ../install/ios
