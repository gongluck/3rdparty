del /f /s /q "..\build\android\*.*"
rd  /s /q "..\build\android"

cd ../src && git submodule update --init && cd ../script

set ANDROID_NDK_HOME=E:/code/android/ndk/android-ndk-r21b
set platform=android-22
set pathprefix=../build/android
set buildparams=-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" -DANDROID_NDK="%ANDROID_NDK_HOME%"

rem armeabi-v7a
set abi=armeabi-v7a
cmake -G "Unix Makefiles" -S ../src -B %pathprefix%/%abi% %buildparams% ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DCMAKE_INSTALL_PREFIX=%pathprefix%/../../install/android/%abi% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/armeabi -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/armeabi/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/armeabi/libcrypto.a ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%abi%/libsrtp2.a ^
-DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/android/%abi%/libusrsctp.a ^
-DENABLE_WEBRTC=ON -DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build %pathprefix%/%abi% --clean-first --config release --target all -- -j8
cmake --install %pathprefix%/%abi% --prefix %pathprefix%/../../install/android/%abi% --config release
xcopy /S /Y /I ..\src\release\android\release\* ..\install\android\%abi%\lib\

rem arm64-v8a
set abi=arm64-v8a
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DCMAKE_INSTALL_PREFIX=../install/android/%abi% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/%abi%/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%abi%/libsrtp2.a ^
-DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/android/%abi%/libusrsctp.a ^
-DENABLE_WEBRTC=ON -DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --prefix ../install/android/%abi% --config release
xcopy /S /Y /I ..\src\release\android\release\* ..\install\android\%abi%\lib\

rem x86
set abi=x86
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DCMAKE_INSTALL_PREFIX=../install/android/%abi% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/%abi%/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%abi%/libsrtp2.a ^
-DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/android/%abi%/libusrsctp.a ^
-DENABLE_WEBRTC=ON -DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --prefix ../install/android/%abi% --config release
xcopy /S /Y /I ..\src\release\android\release\* ..\install\android\%abi%\lib\

rem x86_64
set abi=x86_64
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DCMAKE_INSTALL_PREFIX=../install/android/%abi% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% -DOPENSSL_SSL_LIBRARY=../../openssl/lib/android/%abi%/libssl.a -DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/android/%abi%/libsrtp2.a ^
-DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/android/%abi%/libusrsctp.a ^
-DENABLE_WEBRTC=ON -DENABLE_SERVER_LIB=ON -DENABLE_TESTS=OFF -DENABLE_API_STATIC_LIB=ON -DENABLE_CXX_API=ON
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --prefix ../install/android/%abi% --config release
xcopy /S /Y /I ..\src\release\android\release\* ..\install\android\%abi%\lib\

pause
