#代理
#export ALL_PROXY="127.0.0.1:15732"
#建议在香港云服务器上编译！

#环境升级
#参考https://blog.csdn.net/lee890801/article/details/121540167，升级python3到3.8以上！！

mkdir ../android
cd ../android

#下载配置depot_tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH="$PATH:$(pwd)/depot_tools"

#下载更新webrtc源码
mkdir webrtc
cd webrtc
fetch --nohooks webrtc_android
gclient sync --no-history
#拉取特定分支
gclient sync -r 729f79c176c8b4c3a8c1b60f39df5fb43323b27b --no-history

#下载依赖
./src/build/install-build-deps.sh
#./src/build/install-build-deps-android.sh

cd src
source build/android/envsetup.sh

#native编译
gn clean out/native_arm
gn gen out/native_arm --args='target_os="android" target_cpu="arm"'
ninja -C out/native_arm

#打包aar
tools_webrtc/android/build_aar.py --build-dir ../out/ --output ../out/libwebrtc.aar --arch "armeabi-v7a" "arm64-v8a" "x86_64" --extra-gn-args='is_debug=false' --verbose
#tools_webrtc/android/release_aar.py --build-dir out/build_release_aar --verbose
