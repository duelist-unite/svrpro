pm2 stop all

cd update
./updatecards.sh
cd ..

pm2 start all
