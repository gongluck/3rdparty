del /f /s /q "../build/android/*.*"
rd  /s /q "../build/android"
del /f /s /q "../install/android/*.*"
rd  /s /q "../install/android"

rem armeabi-v7a-shared
call:build armeabi-v7a-shared armeabi-v7a ON

rem armeabi-v7a-static
call:build armeabi-v7a-static armeabi-v7a OFF

rem arm64-v8a-shared
call:build arm64-v8a-shared arm64-v8a ON

rem arm64-v8a-static
call:build arm64-v8a-static arm64-v8a OFF

rem x86-shared
call:build x86-shared x86 ON

rem x86-static
call:build x86-static x86 OFF

rem x86_64-shared
call:build x86_64-shared x86_64 ON

rem x86_64-static
call:build x86_64-static x86_64 OFF

goto EOF

rem params: type(armeabi-v7a-shared) abi(armeabi-v7a) build_shared_libs(ON)
:build
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%1 ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=%2 ^
    -DANDROID_PLATFORM=android-22 ^
    -DBUILD_SHARED_LIBS=%3
cmake --build ../build/android/%1 --clean-first --config release --target all
cmake --install ../build/android/%1 --config release --prefix ../install/android/%1

:EOF