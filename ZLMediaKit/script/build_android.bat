del /f /s /q "../build/android/*.*"
rd  /s /q "../build/android"
del /f /s /q "../install/android/*.*"
rd  /s /q "../install/android"

rem set ANDROID_NDK_HOME=E:/code/android/ndk/android-ndk-r21b

cd ../src && git submodule update --init && cd ../script

rem armeabi-v7a-shared
call:build armeabi-v7a-shared armeabi-v7a ON armeabi OFF

rem armeabi-v7a-static
call:build armeabi-v7a-static armeabi-v7a OFF armeabi ON

rem arm64-v8a-shared
call:build arm64-v8a-shared arm64-v8a ON arm64-v8a OFF

rem arm64-v8a-static
call:build arm64-v8a-static arm64-v8a OFF arm64-v8a ON

rem x86-shared
call:build x86-shared x86 ON x86 OFF

rem x86-static
call:build x86-static x86 OFF x86 ON

rem x86_64-shared 
call:build x86_64-shared x86_64 ON x86_64 OFF

rem x86_64-static
call:build x86_64-static x86_64 OFF x86_64 ON

goto EOF

rem params: type(armeabi-v7a-shared) abi(armeabi-v7a) build_shared_libs(ON) openssl_platform(armeabi) enable_api_static_lib(OFF)
:build
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%1 ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DCMAKE_INSTALL_PREFIX=../install/android/%1 ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=%2 ^
    -DCMAKE_BUILD_TYPE=release ^
    -DANDROID_PLATFORM=android-22 ^
    -DBUILD_SHARED_LIBS=%3 ^
    -DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%4 -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/%4/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%4/libcrypto.a ^
    -DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%2/libsrtp2.a ^
    -DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/android/%2/libusrsctp.a ^
    -DENABLE_WEBRTC=ON -DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=%5 -DENABLE_CXX_API=ON
cmake --build ../build/android/%1 --clean-first --config release --target all -- -j8
cmake --install ../build/android/%1 --config release --prefix ../install/android/%1
xcopy /S /Y /I ..\src\release\android\release\*.a ..\install\android\%1\lib\
xcopy /S /Y /I ..\src\release\android\release\*.so ..\install\android\%1\bin\

:EOF