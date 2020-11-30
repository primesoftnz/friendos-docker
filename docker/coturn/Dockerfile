FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-utils software-properties-common ca-certificates openssl git vim coturn

ADD ./etc/turnserver.conf /etc/turnserver.conf
ADD ./etc/default/coturn /etc/default/coturn
RUN mkdir -p /etc/certs 

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html/

EXPOSE 3478 3478/udp 4443

ENTRYPOINT ["/entrypoint.sh"]
# CMD [ "tail", "-f", "/dev/null" ]
