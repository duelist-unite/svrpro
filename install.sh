#!/bin/bash
install_path="$(pwd)/server"
mkdir -p $install_path
cd $install_path
echo "install_path=\"$install_path\"" > $install_path/config.sh
echo "Installing to $install_path..."

echo "Installing required libraries..."
sudo apt-get install -y apt-transport-https
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl git build-essential libreadline-dev libsqlite3-dev mono-complete nodejs premake4 libevent-dev tzdata
sudo npm install pm2 -g

mkdir lib
cd lib

echo "Installing resdis-server..."
wget http://download.redis.io/releases/redis-stable.tar.gz --no-check-certificate
tar xzfv redis-stable.tar.gz
cd redis-stable
make
sudo make install
sudo cp -rf src/redis-server /usr/bin/
pm2 start redis-server
cd ..

cd ..

echo "Downloading YGOPro Server..."
git clone https://github.com/wSedlacek/ygopro-server ygopro-server --recursive
cd ygopro-server

echo "Installing YGOPro Server Dependancies..."
npm install

echo "Compiling..."
./compile.sh

echo "Updating Cards..."
cd ygopro/update
./updatecards.sh
cd ../..

echo "Starting Windbot..."
cd windbot
pm2 start pm2.json
cd ..

echo "Starting YGOPro Server..."
cd $install_path/ygopro-server
pm2 start ygopro-server.js
pm2 start restart.js

echo "Saving Started Servers..."
pm2 save
pm2 startup
