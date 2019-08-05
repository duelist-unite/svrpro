#!/bin/bash
echo "Installing required libraries..."
sudo apt-get install -y apt-transport-https
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y curl git build-essential libreadline-dev libsqlite3-dev mono-complete nodejs premake4 libevent-dev tzdata
npm install pm2 -g

# mkdir lib
# cd lib

# echo "Installing resdis-server..."
# wget http://download.redis.io/releases/redis-stable.tar.gz --no-check-certificate
# tar xzfv redis-stable.tar.gz
# cd redis-stable
# make
# sudo make install
# sudo cp -rf src/redis-server /usr/bin/
# pm2 start redis-server
# cd ..

# cd ..

echo "Downloading YGOPro Server..."
git clone https://gitlab.com/duelists-unite/svrpro.git svrpro-beta --recursive
cd svrpro-beta

echo "Installing YGOPro Server Dependancies..."
npm install

echo "Compiling..."
./compile.sh

echo "Starting Windbot..."
cd windbot
pm2 start pm2.json
cd ..

echo "Starting YGOPro Server..."
pm2 start ygopro-server.js
# pm2 start restart.js

echo "Saving Started Servers..."
pm2 save
pm2 startup
