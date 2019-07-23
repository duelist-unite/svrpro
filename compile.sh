#!/bin/bash
echo "Compiling Windbot..."
cd windbot
./compile.sh
cd ..

echo "Compiling YGOPro Core..."
cd ygopro
./compile.sh
cd ..
