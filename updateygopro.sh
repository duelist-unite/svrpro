#!/bin/bash
source ../config.sh
if [ -z "$install_path" ]; then
  echo Could not determime install path.
  exit 0
fi

echo "Updating YGOPro Core"

pm2 stop all 

cd $install_path/ygopro-server
## rm -rf ygopro ## Let's not rebuild everytime.

git clone https://github.com/purerosefallen/ygopro --branch=server
cd ygopro
git reset --hard
git pull

git clone https://github.com/szefo09/script.git
cd script
git reset --hard
git pull
cd ..

git clone https://github.com/Fluorohydride/ygopro-core.git ocgcore
cd ocgcore
git reset --hard
git pull
cd ..

cd ..

./update.sh
./updatewindbot.sh

cd ygopro
#git submodule foreach git checkout master
premake4 gmake
cd build/
make -j5 config=release
cd ..

ln -s bin/release/ygopro ./
strip ygopro
mkdir replay
mkdir expansions
cd ..

chmod -R 777 $install_path/*

pm2 start all
