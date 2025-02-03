#!/bin/bash
echo "Deploy"
cp -f ../bin/libNet.so .
cp -f ../bin/libpq.so.5 .
cp -f ../bin/AccountService.so .
cp -f ../bin/fancy-server .

echo "Chmod"
chmod u+x ./Guard.sh
chmod u+x ./fancy-server
chmod 711 ./fancy-server
chmod +s ./fancy-server

echo "Start"
./Guard.sh fancy-server as 1