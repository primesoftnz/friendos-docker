#!/bin/bash
FRIEND_CORE=/var/www/html/friendup/build/FriendCore

if [ ! -f "$FRIEND_CORE" ]; then
    cd /var/www/html/friendup
    echo "OPENSSL_INTERNAL=1" > Config
    echo "USE_SSH_THREADS_LIB=0" >> Config
    make clean setup compile install
fi

if [ -d "/var/www/html/friend-office" ]; then
cd /var/www/html/friend-office
./update_to_friend
fi

chown www-data:www-data -R /var/www/html/friendup

cd /var/www/html/friendup/build
./FriendCore 
