del /f /s /q "../build/android/*.*"
rd  /s /q "../build/android"

rem armeabi-v7a-shared
cmake -G "Unix Makefiles" -S ../src/source -B ../build/android/armeabi-v7a-shared ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=armeabi-v7a ^
    -DANDROID_PLATFORM=android-22 ^
    -DENABLE_ASSEMBLY=OFF ^
    -DENABLE_CLI=OFF ^
    -DENABLE_SHARED=ON
cmake --build ../build/android/armeabi-v7a-shared --clean-first --config release --target all

rem armeabi-v7a-static
cmake -G "Unix Makefiles" -S ../src/source -B ../build/android/armeabi-v7a-static ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=armeabi-v7a ^
    -DANDROID_PLATFORM=android-22 ^
    -DENABLE_ASSEMBLY=OFF ^
    -DENABLE_CLI=OFF ^
    -DENABLE_SHARED=OFF
cmake --build ../build/android/armeabi-v7a-static --clean-first --config release --target all

rem arm64-v8a-shared
cmake -G "Unix Makefiles" -S ../src/source -B ../build/android/arm64-v8a-shared ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=arm64-v8a ^
    -DANDROID_PLATFORM=android-22 ^
    -DENABLE_ASSEMBLY=OFF ^
    -DENABLE_SHARED=ON
cmake --build ../build/android/arm64-v8a-shared --clean-first --config release --target all

rem arm64-v8a-static
cmake -G "Unix Makefiles" -S ../src/source -B ../build/android/arm64-v8a-static ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=arm64-v8a ^
    -DANDROID_PLATFORM=android-22 ^
    -DENABLE_CLI=OFF ^
    -DENABLE_ASSEMBLY=OFF ^
    -DENABLE_SHARED=OFF
cmake --build ../build/android/arm64-v8a-static --clean-first --config release --target all

rem x86-shared
cmake -G "Unix Makefiles" -S ../src/source -B ../build/android/x86-shared ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=x86 ^
    -DANDROID_PLATFORM=android-22 ^
    -DENABLE_CLI=OFF ^
    -DENABLE_ASSEMBLY=OFF ^
    -DENABLE_SHARED=ON
cmake --build ../build/android/x86-shared --clean-first --config release --target all

rem x86-static
cmake -G "Unix Makefiles" -S ../src/source -B ../build/android/x86-static ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=x86 ^
    -DANDROID_PLATFORM=android-22 ^
    -DENABLE_CLI=OFF ^
    -DENABLE_ASSEMBLY=OFF ^
    -DENABLE_SHARED=OFF
cmake --build ../build/android/x86-static --clean-first --config release --target all

rem x86_64-shared
cmake -G "Unix Makefiles" -S ../src/source -B ../build/android/x86_64-shared ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=x86_64 ^
    -DANDROID_PLATFORM=android-22 ^
    -DENABLE_CLI=OFF ^
    -DENABLE_ASSEMBLY=OFF ^
    -DENABLE_SHARED=ON
cmake --build ../build/android/x86_64-shared --clean-first --config release --target all

rem x86_64-static
cmake -G "Unix Makefiles" -S ../src/source -B ../build/android/x86_64-static ^
    -DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%/build/cmake/android.toolchain.cmake" ^
    -DCMAKE_BUILD_TYPE=release ^
    -DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%/prebuilt/windows-x86_64/bin/make.exe" ^
    -DANDROID_NDK="%ANDROID_NDK_HOME%" ^
    -DANDROID_ABI=x86_64 ^
    -DANDROID_PLATFORM=android-22 ^
    -DENABLE_CLI=OFF ^
    -DENABLE_ASSEMBLY=OFF ^
    -DENABLE_SHARED=OFF
cmake --build ../build/android/x86_64-static --clean-first --config release --target all

pause