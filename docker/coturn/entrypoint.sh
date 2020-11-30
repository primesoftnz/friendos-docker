#!/bin/bash

service coturn start

tail -f /var/log/turnserver.log
# tail -f /dev/null
