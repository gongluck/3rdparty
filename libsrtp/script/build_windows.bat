del /f /s /q "../build/windows/*.*"
rd  /s /q "../build/windows"

rem 从http://slproweb.com/products/Win32OpenSSL.html下载安装openssl1.1

rem win32
cmake -S ../src -B ../build/windows/win32 -G "Visual Studio 16 2019" -A win32 ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=C:/OpenSSL-Win32/include ^
-DLIB_EAY_DEBUG:FILEPATH=C:/OpenSSL-Win32/lib/VC/libcrypto32MTd.lib ^
-DLIB_EAY_RELEASE:FILEPATH=C:/OpenSSL-Win32/lib/VC/libcrypto32MT.lib ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_WITH_WARNINGS=OFF
cmake --build ../build/windows/win32 --clean-first --config release --target ALL_BUILD
cmake --install ../build/windows/win32 --config release --prefix ../install/windows/win32

rem x64
cmake -S ../src -B ../build/windows/x64 -G "Visual Studio 16 2019" -A x64 ^
-DENABLE_OPENSSL=ON -DOPENSSL_INCLUDE_DIR=C:/OpenSSL-Win64/include ^
-DLIB_EAY_DEBUG:FILEPATH=C:/OpenSSL-Win64/lib/VC/libcrypto64MTd.lib ^
-DLIB_EAY_RELEASE:FILEPATH=C:/OpenSSL-Win64/lib/VC/libcrypto64MT.lib ^
-DBUILD_SHARED_LIBS=ON ^
-DBUILD_WITH_WARNINGS=OFF
cmake --build ../build/windows/x64 --clean-first --config release --target ALL_BUILD
cmake --install ../build/windows/x64 --config release --prefix ../install/windows/x64

pause