del /f /s /q "../build/windows/*.*"
rd  /s /q "../build/windows"

rem 更新子模块
git submodule update --init
rem 如果使用openssl
rem 从http://slproweb.com/products/Win32OpenSSL.html下载安装openssl
rem 并设置-DENABLE_OPENSSL=ON和-DOPENSSL_ROOT_DIR=openssl路径

rem win32
cmake -S ../src -B ../build/windows/win32 -G "Visual Studio 16 2019" -A win32 -DENABLE_OPENSSL=OFF
cmake --build ../build/windows/win32 --clean-first --config release --target ALL_BUILD

rem x64
cmake -S ../src -B ../build/windows/x64 -G "Visual Studio 16 2019" -A x64 -DENABLE_OPENSSL=OFF
cmake --build ../build/windows/x64 --clean-first --config release --target ALL_BUILD

pause