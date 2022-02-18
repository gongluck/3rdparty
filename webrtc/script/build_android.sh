#代理
#export ALL_PROXY="127.0.0.1:15732"
#建议在香港云服务器上编译！

mkdir ../android
cd ../android

#下载配置depot_tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH="$PATH:$(pwd)/depot_tools"

#下载更新webrtc源码
mkdir webrtc
cd webrtc
fetch --nohooks webrtc_android
gclient sync

#下载依赖
./src/build/install-build-deps.sh
./src/build/install-build-deps-android.sh

cd src
source build/android/envsetup.sh
#native编译
gn clean out/native_arm
gn gen out/native_arm --args='target_os="android" target_cpu="arm"'
ninja -C out/native_arm
#打包aar
tools_webrtc/android/build_aar.py --build-dir out/build_aar --arch "armeabi-v7a" "arm64-v8a" "x86" "x86_64"
#tools_webrtc/android/release_aar.py --build-dir out/build_release_aar --verbose
