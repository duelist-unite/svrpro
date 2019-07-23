#!/bin/bash
git submodule update --remote
git remote add -f upstream https://github.com/purerosefallen/ygopro-server
git merge upstream/master --no-commit

cd windbot
./update.sh
cd ..

cd ygopro
./update.sh
cd ..

git commit -a -m "autoUpdate"
git push
