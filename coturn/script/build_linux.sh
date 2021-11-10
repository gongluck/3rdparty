# 安装依赖
sudo apt-get install -y libssl-dev
sudo apt-get install -y libevent-dev

cd ../src

sudo apt-get install -y dos2unix
sudo dos2unix ./configure

./configure --prefix=../build
sudo make -j 8
sudo make install

#turnserver --min-port 40000 --max-port 60000 -L 0.0.0.0 -a -u gongluck:123456 -v -f -r nort.gov
