#!/bin/bash
git add -A
git reset --hard
git pull

git submodule foreach "git add -A && git reset --hard"
git fetch origin && git add -A && git reset --hard && git checkout origin/master

git submodule sync --recursive
git submodule update --recursive --init
git submodule update --recursive --remote