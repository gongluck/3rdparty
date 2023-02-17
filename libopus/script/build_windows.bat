del /f /s /q "../build/windows/*.*"
rd  /s /q "../build/windows"
del /f /s /q "../install/windows/*.*"
rd  /s /q "../install/windows"

rem win32-md-shared
call :build win32-md-shared win32 ON DLL

rem win32-md-static
call :build win32-md-static win32 OFF DLL

rem win32-mt-shared
call :build win32-mt-shared win32 ON

rem win32-mt-static
call :build win32-mt-static win32 OFF

rem x64-md-shared
call :build x64-md-shared x64 ON  DLL

rem x64-md-static
call :build x64-md-static x64 OFF DLL

rem x64-mt-shared
call :build x64-mt-shared x64 ON

rem x64-mt-static
call :build x64-mt-static x64 OFF

goto EOF

rem params: type(win32-md-shared) platform(win32) build_shared_libs(ON) runtimelibrary(DLL)
:build
cmake -S ../src -B ../build/windows/%1 -G "Visual Studio 16 2019" -A %2 ^
    -DCMAKE_POLICY_DEFAULT_CMP0091=NEW -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>%4" -DBUILD_SHARED_LIBS=%3
cmake --build ../build/windows/%1 --clean-first --config release --target ALL_BUILD
cmake --install ../build/windows/%1 --config release --prefix ../install/windows/%1

:EOF
