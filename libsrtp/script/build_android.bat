del /f /s /q "../build/android/*.*"
rd  /s /q "../build/android"

rem 需要依赖openssl

set ANDROID_NDK_HOME=E:/code/android/ndk/android-ndk-r21b
set platform=android-22

rem armeabi-v7a
set abi=armeabi-v7a
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/armeabi ^
-DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/armeabi/libcrypto.a ^
-DBUILD_SHARED_LIBS=OFF ^
-DBUILD_WITH_WARNINGS=OFF
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --config release --prefix ../install/android/%abi%

rem arm64-v8a
set abi=arm64-v8a
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% ^
-DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DBUILD_SHARED_LIBS=OFF ^
-DBUILD_WITH_WARNINGS=OFF
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --config release --prefix ../install/android/%abi%

rem x86
set abi=x86
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% ^
-DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DBUILD_SHARED_LIBS=OFF ^
-DBUILD_WITH_WARNINGS=OFF
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --config release --prefix ../install/android/%abi%

rem x86_64
set abi=x86_64
cmake -G "Unix Makefiles" -S ../src -B ../build/android/%abi% ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=../../openssl/include/android/%abi% ^
-DOPENSSL_CRYPTO_LIBRARY=../../openssl/lib/android/%abi%/libcrypto.a ^
-DBUILD_SHARED_LIBS=OFF ^
-DBUILD_WITH_WARNINGS=OFF
cmake --build ../build/android/%abi% --clean-first --config release --target all -- -j8
cmake --install ../build/android/%abi% --config release --prefix ../install/android/%abi%

pause
