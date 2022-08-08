del /f /s /q "../build/windows/*.*"
rd  /s /q "../build/windows"

rem 更新子模块
cd ../src && git submodule update --init && cd ../script

rem 如果使用openssl
rem 从http://slproweb.com/products/Win32OpenSSL.html下载安装openssl(非light)
rem 并设置-DENABLE_OPENSSL=ON和-DOPENSSL_ROOT_DIR=openssl路径

rem 如果使用webrtc
rem 设置-DENABLE_WEBRTC=ON
rem ➕按上面说明启用openssl
rem ➕设置srtp库路径

rem win32
cmake -S ../src -B ../build/windows/win32 -G "Visual Studio 16 2019" -A win32 ^
-DENABLE_OPENSSL=ON -DOPENSSL_ROOT_DIR=C:/OpenSSL-Win32 ^
-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/windows/win32/srtp2.lib ^
-DENABLE_WEBRTC=ON
cmake --build ../build/windows/win32 --clean-first --config release --target ALL_BUILD

rem x64
@REM cmake -S ../src -B ../build/windows/x64 -G "Visual Studio 16 2019" -A x64 -DENABLE_OPENSSL=OFF ^
@REM -DENABLE_OPENSSL=ON -DOPENSSL_ROOT_DIR=C:/OpenSSL-Win64 ^
@REM -DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/windows/x64/srtp2.lib ^
@REM -DENABLE_WEBRTC=ON
@REM cmake --build ../build/windows/x64 --clean-first --config release --target ALL_BUILD

pause
