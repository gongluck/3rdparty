rem 设置代理
rem 使用cmd
cmd

rem 安装VS2019和SDK调试工具
rem 安装python3.8以上版本

mkdir ../windows
cd ../windows

rem 下载配置depot_tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
set PATH=%cd%\depot_tools;%PATH%

rem 设置环境变量
set GYP_MSVS_VERSION = 2019
set GYP_MSVS_OVERRIDE_PATH = C:\Program Files (x86)\Microsoft Visual Studio\2019\Community
set GYP_GENERATORS=msvs-ninja,ninja
set DEPOT_TOOLS_WIN_TOOLCHAIN=0

rem 下载更新webrtc源码
mkdir webrtc
cd webrtc
fetch --nohooks webrtc
gclient sync

rem 编译
cd src
gn gen --ide=vs2019 out/vs2019 --args="is_debug=true is_clang=true target_cpu=\"x86\""
ninja -C out/vs2019
