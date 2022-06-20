del /f /s /q "../build/windows/*.*"
rd  /s /q "../build/windows"

rem win32-md-shared
cmake -S ../src -B ../build/windows/win32-md-shared -G "Visual Studio 16 2019" -A win32 ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>DLL" -DBUILD_SHARED_LIBS=ON
cmake --build ../build/windows/win32-md-shared --clean-first --config release --target ALL_BUILD

rem win32-md-static
cmake -S ../src -B ../build/windows/win32-md-static -G "Visual Studio 16 2019" -A win32 ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>DLL" -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=ON
cmake --build ../build/windows/win32-md-static --clean-first --config release --target ALL_BUILD

rem win32-mt-shared
cmake -S ../src -B ../build/windows/win32-mt-shared -G "Visual Studio 16 2019" -A win32 ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>" -DBUILD_SHARED_LIBS=ON
cmake --build ../build/windows/win32-mt-shared --clean-first --config release --target ALL_BUILD

rem win32-mt-static
cmake -S ../src -B ../build/windows/win32-mt-static -G "Visual Studio 16 2019" -A win32 ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>" -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=ON
cmake --build ../build/windows/win32-mt-static --clean-first --config release --target ALL_BUILD

rem x64-md-shared
cmake -S ../src -B ../build/windows/x64-md-shared -G "Visual Studio 16 2019" -A x64 ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>DLL" -DBUILD_SHARED_LIBS=ON
cmake --build ../build/windows/x64-md-shared --clean-first --config release --target ALL_BUILD

rem x64-md-static
cmake -S ../src -B ../build/windows/x64-md-static -G "Visual Studio 16 2019" -A x64 ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>DLL" -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=ON
cmake --build ../build/windows/x64-md-static --clean-first --config release --target ALL_BUILD

rem x64-mt-shared
cmake -S ../src -B ../build/windows/x64-mt-shared -G "Visual Studio 16 2019" -A x64 ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>" -DBUILD_SHARED_LIBS=ON
cmake --build ../build/windows/x64-mt-shared --clean-first --config release --target ALL_BUILD

rem x64-mt-static
cmake -S ../src -B ../build/windows/x64-mt-static -G "Visual Studio 16 2019" -A x64 ^
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>" -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=ON
cmake --build ../build/windows/x64-mt-static --clean-first --config release --target ALL_BUILD

pause