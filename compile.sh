#!/bin/bash
echo "Compiling YGOPro Core..."
./compile.sh
cd ..

echo "Compiling Windbot..."
cd windbot
./compile.sh
cd ..
