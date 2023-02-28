del /f /s /q "../build/windows/*.*"
rd  /s /q "../build/windows"
del /f /s /q "../install/windows/*.*"
rd  /s /q "../install/windows"

rem 更新子模块
cd ../src && git submodule update --init && cd ../script

rem 如果使用openssl
rem 从http://slproweb.com/products/Win32OpenSSL.html下载安装openssl(非light)
rem 并设置-DENABLE_OPENSSL=ON和-DOPENSSL_ROOT_DIR=openssl路径

rem 如果使用webrtc
rem 设置-DENABLE_WEBRTC=ON
rem ?按上面说明启用openssl
rem ?设置srtp库路径

set NULL=

rem win32-md-shared
call :build win32-md-shared win32 ON "C:/OpenSSL-Win32" OFF DLL

rem win32-md-static
call :build win32-md-static win32 OFF "C:/OpenSSL-Win32" ON DLL

rem win32-mt-shared
call :build win32-mt-shared win32 ON "C:/OpenSSL-Win32" OFF

rem win32-mt-static
call :build win32-mt-static win32 OFF "C:/OpenSSL-Win32" ON

rem x64-md-shared
call :build x64-md-shared x64 ON "C:/OpenSSL-Win64" OFF DLL

rem x64-md-static
call :build x64-md-static x64 OFF "C:/OpenSSL-Win64" ON DLL

rem x64-mt-shared
call :build x64-mt-shared x64 ON "C:/OpenSSL-Win64" OFF

rem x64-mt-static
call :build x64-mt-static x64 OFF "C:/OpenSSL-Win64" ON

goto EOF

rem params: type(win32-md-shared) platform(win32) build_shared_libs(ON) openssldir("C:/OpenSSL-Win32") enable_api_static_lib(OFF) runtimelibrary(DLL)
:build
cmake -S ../src -B ../build/windows/%1 -G "Visual Studio 16 2019" -A %2 ^
    -DCMAKE_POLICY_DEFAULT_CMP0091=NEW -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>%6" -DBUILD_SHARED_LIBS=%3 ^
    -DCMAKE_INSTALL_PREFIX=../install/windows/%1 ^
    -DENABLE_OPENSSL=ON -DOPENSSL_ROOT_DIR=%4 ^
    -DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/windows/%2/srtp2.lib ^
    -DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/windows/%2/usrsctp.lib ^
    -DENABLE_WEBRTC=ON -DENABLE_CXX_API=ON -DENABLE_API_STATIC_LIB=%5 ^
    -DCMAKE_CXX_FLAGS_RELEASE="/MP" -DCMAKE_BUILD_TYPE=Release
cmake --build ../build/windows/%1 --clean-first --config release --target ALL_BUILD
cmake --install ../build/windows/%1 --config release --prefix ../install/windows/%1

:EOF
