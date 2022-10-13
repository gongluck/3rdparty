del /f /s /q "..\build\windows\*.*"
rd  /s /q "..\build\windows"

rem win32
cmake -S ../src -B ../build/windows/win32 -G "Visual Studio 16 2019" -A win32 ^
-Dsctp_werror=0 -DCMAKE_C_FLAGS_RELEASE="/MP /MT"
cmake --build ../build/windows/win32 --clean-first --config release --target ALL_BUILD
cmake --install ../build/windows/win32 --config release --prefix ../install/windows/win32

rem x64
cmake -S ../src -B ../build/windows/x64 -G "Visual Studio 16 2019" -A x64 ^
-Dsctp_werror=0 -DCMAKE_C_FLAGS_RELEASE="/MP /MT"
cmake --build ../build/windows/x64 --clean-first --config release --target ALL_BUILD
cmake --install ../build/windows/x64 --config release --prefix ../install/windows/x64

pause