# 安装依赖
sudo apt-get install -y libssl-dev
sudo apt-get install -y libevent-dev
sudo apt-get install -y pkg-config

#切换到coturn源码目录
cd ../src

#windows文件格式切换到linux
sudo apt-get install -y dos2unix
sudo dos2unix ./configure

#配置
./configure --prefix=../build
#cmake
#cmake -G "Unix Makefiles" -S . -B ./build -DCMAKE_BUILD_TYPE=release

#编译
sudo make -j 8
sudo make install
#cmake
cmake --build ./build --clean-first --config release --target all

#turnserver --min-port 40000 --max-port 60000 -L 0.0.0.0 -a -u gongluck:123456 -v -f -r nort.gov
