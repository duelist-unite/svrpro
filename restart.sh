#pm2 stop all

cd ygopro/update
./updatecards.sh
cd ../..

pm2 restart all
