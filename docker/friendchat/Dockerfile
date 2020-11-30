FROM node:12

RUN apt-get update && apt-get install -y apt-utils software-properties-common && apt-get install -y mysql-client 

ADD ./friendchat/server/config.js /var/www/html/cfg/friendchat/config.js
ADD ./friendchat/server/TLS /var/www/html/cfg/friendchat/TLS
ADD ./presence/config.js /var/www/html/cfg/presence/config.js

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

EXPOSE 3000 3001 27970

ENTRYPOINT ["/entrypoint.sh"]