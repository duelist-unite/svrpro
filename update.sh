#!/bin/bash
echo "Updating YGOPro-server..."
git submodule update --remote
git remote add -f upstream https://github.com/purerosefallen/ygopro-server
git merge upstream/master --no-commit

echo "Updating Windbot..."
cd windbot
./update.sh
cd ..

echo "Updating YGOPro core..."
cd ygopro
./update.sh
cd ..

echo "Publishing Update..."
git commit -a -m "autoUpdate"
git push origin HEAD:master
