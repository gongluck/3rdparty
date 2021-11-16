# 安装依赖
sudo apt-get update
sudo apt-get install -y nodejs npm openjdk-8-jdk node-grunt-cli python-pip
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-363.0.0-linux-x86_64.tar.gz
tar zxf google-cloud-sdk-363.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh
./google-cloud-sdk/bin/gcloud init
#在https://console.cloud.google.com/cloud-resource-manager创建仓库

#git clone https://github.com/webrtc/apprtc.git
#cd apprtc
cd ../src
npm install
npm install grunt # 编译工具
pip install -r requirements.txt
sudo npm install grunt -g
grunt build
gcloud components install app-engine-python-extras app-engine-python cloud-datastore-emulator

#./google-cloud-sdk/bin/dev_appserver.py --host 127.0.0.1 ../src/out/app_engine