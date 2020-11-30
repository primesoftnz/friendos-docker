#!/bin/bash

cp /etc/nginx/sites-available/friend.conf /etc/nginx/sites-enabled/
service nginx start

tail -f /var/log/nginx/access.log
