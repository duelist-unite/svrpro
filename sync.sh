#!/bin/bash
pm2 stop all
git pull --recurse-submodules
pm2 start all
