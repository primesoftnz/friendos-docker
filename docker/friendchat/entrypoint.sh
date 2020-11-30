#!/bin/bash

cp ./cfg/friendchat/config.js ./friendchat/server/
cp -r ./cfg/friendchat/TLS ./friendchat/server/TLS
cp ./cfg/presence/config.js ./presence
rm -rfv ./cfg

cd /var/www/html/presence/
if [ ! -e "/var/www/html/presence/node_modules" ]; then 
  npm install && npm rebuild
fi
nohup node presence.js &
sleep 2

cd /var/www/html/friendchat/server/
if [ ! -e "/var/www/html/friendchat/server/node_modules" ]; then 
  npm install
fi

node hello.js

# tail -f /dev/null