del /f /s /q "..\build\windows\*.*"
rd  /s /q "..\build\windows"

rem 更新子模块
cd ../src && git submodule update --init && cd ../script

rem 如果使用openssl
rem 从http://slproweb.com/products/Win32OpenSSL.html下载安装openssl(非light)
rem 并设置-DENABLE_OPENSSL=ON和-DOPENSSL_ROOT_DIR=openssl路径

rem 如果使用webrtc
rem 设置-DENABLE_WEBRTC=ON
rem ➕按上面说明启用openssl
rem ➕设置srtp库路径

set pathprefix=../build/windows

rem win32
set buildtype=Release
set platform=win32
set buildpath=%pathprefix%/%platform%
set opensslparams=-DENABLE_OPENSSL=ON -DOPENSSL_ROOT_DIR=C:/OpenSSL-Win32
set srtparams=-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/windows/win32/srtp2.lib
set sctparams=-DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/windows/win32/usrsctp.lib
cmake -S ../src -B %buildpath% -G "Visual Studio 16 2019" -A %platform% -DCMAKE_INSTALL_PREFIX=%pathprefix%/../../install/windows/%platform% ^
%opensslparams% %srtparams% %sctparams% -DENABLE_WEBRTC=ON -DENABLE_CXX_API=ON -DENABLE_API_STATIC_LIB=OFF ^
-DCMAKE_CXX_FLAGS_RELEASE="/MP /MT" -DCMAKE_BUILD_TYPE=%buildtype%
cmake --build %buildpath% --clean-first --config release --target ALL_BUILD
cmake --install %buildpath% --prefix %pathprefix%/../../install/windows/%platform% --config release
xcopy /S /Y /I ..\src\release\windows\%buildtype%\Release\* ..\install\windows\%platform%\lib\

rem x64
set buildtype=Release
set platform=x64
set buildpath=%pathprefix%/%platform%
set opensslparams=-DENABLE_OPENSSL=ON -DOPENSSL_ROOT_DIR=C:/OpenSSL-Win64
set srtparams=-DSRTP_INCLUDE_DIRS=../../libsrtp/include -DSRTP_LIBRARIES=../../libsrtp/lib/windows/x64/srtp2.lib
set sctparams=-DSCTP_INCLUDE_DIRS=../../usrsctp/include -DSCTP_LIBRARIES=../../usrsctp/lib/windows/x64/usrsctp.lib
cmake -S ../src -B %buildpath% -G "Visual Studio 16 2019" -A %platform% -DCMAKE_INSTALL_PREFIX=%pathprefix%/../../install/windows/%platform% ^
%opensslparams% %srtparams% %sctparams% -DENABLE_WEBRTC=ON -DENABLE_CXX_API=ON -DENABLE_API_STATIC_LIB=OFF ^
-DCMAKE_CXX_FLAGS_RELEASE="/MP /MT" -DCMAKE_BUILD_TYPE=%buildtype%
cmake --build %buildpath% --clean-first --config release --target ALL_BUILD
cmake --install %buildpath% --prefix %pathprefix%/../../install/windows/%platform% --config release
xcopy /S /Y /I ..\src\release\windows\%buildtype%\Release\* ..\install\windows\%platform%\lib\

pause
