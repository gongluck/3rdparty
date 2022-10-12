del /f /s /q "../build/android/*.*"
rd  /s /q "../build/android"

set ANDROID_NDK_HOME=E:/code/android/ndk/android-ndk-r21b
set platform=android-22
set pathprefix=../build/android
set buildparams=-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" -DANDROID_NDK="%ANDROID_NDK_HOME%"

rem armeabi-v7a
set abi=armeabi-v7a
cmake -G "Unix Makefiles" -S ../src -B %pathprefix%/%abi% %buildparams% ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-Dsctp_werror=0 -Dsctp_inet=0 -Dsctp_inet6=0 -Dsctp_build_programs=0
cmake --build %pathprefix%/%abi% --clean-first --config release --target all -- -j8
cmake --install %pathprefix%/%abi% --config release --prefix %pathprefix%/../../install/android/%abi%

rem arm64-v8a
set abi=arm64-v8a
cmake -G "Unix Makefiles" -S ../src -B %pathprefix%/%abi% %buildparams% ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-Dsctp_werror=0 -Dsctp_inet=0 -Dsctp_inet6=0 -Dsctp_build_programs=0
cmake --build %pathprefix%/%abi% --clean-first --config release --target all -- -j8
cmake --install %pathprefix%/%abi% --config release --prefix %pathprefix%/../../install/android/%abi%

rem x86
set abi=x86
cmake -G "Unix Makefiles" -S ../src -B %pathprefix%/%abi% %buildparams% ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-Dsctp_werror=0 -Dsctp_inet=0 -Dsctp_inet6=0 -Dsctp_build_programs=0
cmake --build %pathprefix%/%abi% --clean-first --config release --target all -- -j8
cmake --install %pathprefix%/%abi% --config release --prefix %pathprefix%/../../install/android/%abi%

rem x86_64
set abi=x86_64
cmake -G "Unix Makefiles" -S ../src -B %pathprefix%/%abi% %buildparams% ^
-DCMAKE_BUILD_TYPE=release -DANDROID_ABI=%abi% -DANDROID_PLATFORM=%platform% ^
-Dsctp_werror=0 -Dsctp_inet=0 -Dsctp_inet6=0 -Dsctp_build_programs=0
cmake --build %pathprefix%/%abi% --clean-first --config release --target all -- -j8
cmake --install %pathprefix%/%abi% --config release --prefix %pathprefix%/../../install/android/%abi%

pause
