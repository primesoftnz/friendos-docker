FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-utils software-properties-common && apt-get install -y nginx nginx-extras

RUN rm /etc/nginx/sites-available/* && rm /etc/nginx/sites-enabled/* && sed -i 's/# server_names_hash_bucket_size/server_names_hash_bucket_size/' /etc/nginx/nginx.conf

COPY ./sites-available/*.conf /etc/nginx/sites-enabled/

ADD ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]
# CMD ["tail", "-f", "/var/log/nginx/access.log"]
