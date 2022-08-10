del /f /s /q "../build/android/*.*"
rd  /s /q "../build/android"

set ANDROID_NDK_HOME=E:/code/android/ndk/android-ndk-r21b
set platform=android-22

cd ../src && git submodule update --init && cd ../script

rem armeabi-v7a
set abi=armeabi-v7a
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DCMAKE_INSTALL_PREFIX=../install/android/%abi% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/armeabi -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/armeabi/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/armeabi/libcrypto.a ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%abi%/libsrtp2.a -DENABLE_WEBRTC=ON ^
-DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --prefix ../install/android/%abi% --config release

rem arm64-v8a
set abi=arm64-v8a
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DCMAKE_INSTALL_PREFIX=../install/android/%abi% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/%abi%/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%abi%/libsrtp2.a -DENABLE_WEBRTC=ON ^
-DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --prefix ../install/android/%abi% --config release

rem x86
set abi=x86
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DCMAKE_INSTALL_PREFIX=../install/android/%abi% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/%abi%/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%abi%/libsrtp2.a -DENABLE_WEBRTC=ON ^
-DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --prefix ../install/android/%abi% --config release

rem x86_64
set abi=x86_64
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DCMAKE_INSTALL_PREFIX=../install/android/%abi% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/%abi%/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%abi%/libsrtp2.a -DENABLE_WEBRTC=ON ^
-DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --prefix ../install/android/%abi% --config release

pause
