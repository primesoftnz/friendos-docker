#!/bin/bash

ln -s /etc/nginx/sites-available/friend.conf /etc/nginx/sites-enabled/friend.conf
cp /etc/nginx/sites-available/documentserver.conf /etc/nginx/sites-enabled/documentserver.conf
cp /etc/nginx/sites-available/community.conf /etc/nginx/sites-enabled/community.conf
service nginx start

tail -f /var/log/nginx/access.log
