# release/4.4分支

# 打开Linux开发环境

# 出现 common.mak:xxx: *** missing separator.  Stop. 的解决办法：
# 执行 git config --global core.autocrlf false 之后重新下载源码

# win32
# 使用32位环境运行
make clean
./configure --enable-postproc --enable-gpl --prefix=../build/win32 --target-os=win32 --toolchain=msvc --arch=x86 --disable-shared --enable-static --disable-debug
make -j 8
make install

# x64
# 使用64位环境运行
make clean
./configure --enable-postproc --enable-gpl --prefix=../build/x64 --target-os=win64 --toolchain=msvc --arch=x64 --disable-shared --enable-static --disable-debug
make -j 8
make install
