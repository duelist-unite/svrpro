#!/bin/bash
source ../config.sh
if [ -z "$install_path" ]; then
  echo Could not determime install path.
  exit 0
fi

echo "Updating Windbot"
cd $install_path/ygopro-server
git clone https://github.com/szefo09/windbot.git --recursive
cd windbot
git reset --hard
git pull
xbuild /property:Configuration=Release /property:TargetFrameworkVersion="v4.5"
ln -s bin/Release/WindBot.exe .
#ln -s ../ygopro/cards.cdb .
cd ..
chmod -R 777 $install_path/*
sudo pm2 restart windbot-server
