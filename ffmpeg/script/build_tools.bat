rem win32
cmake -S ../fftools -B ../build/win32 -G "Visual Studio 16 2019" -A win32
cmake --build ../build/win32 --clean-first --config release --target ALL_BUILD
rem x64
cmake -S ../fftools -B ../build/x64 -G "Visual Studio 16 2019" -A x64
cmake --build ../build/x64 --clean-first --config release --target ALL_BUILD
