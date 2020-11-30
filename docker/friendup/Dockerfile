FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-utils software-properties-common git vim \
    curl \
    libsmbclient-dev \
    libssh2-1-dev \
    libssh-dev \
    libssl-dev \
    libwebsockets-dev \
    libaio-dev \
    php7.2-cli \
    php7.2-gd \
    php7.2-imap \
    php7.2-mysql \
    php7.2-curl \
    php7.2-zip \
    php7.2-mbstring \
    php7.2-readline \
    libmysqlclient-dev \
    build-essential \
    libsqlite3-dev \
    libmatheval-dev \
    libmagic-dev \
    libgd-dev \
    rsync \
    valgrind-dbg \
    libxml2-dev \
    dialog \
    cmake \
    ssh \
    make \
    libuv1

WORKDIR /var/www/html

# friendchat local config
ADD ./friendchat/local.config.js /var/www/html/friendup/build/resources/webclient/apps/FriendChat

ADD ./entrypoint-friend.sh .
RUN chmod +x ./entrypoint-friend.sh

# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["./entrypoint-friend.sh"]