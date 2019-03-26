# Version: 0.0.1
FROM nginx:latest
MAINTAINER Aleksey Ovchinnikov <alexovchinnicov@google.com>

RUN mkdir /var/www

COPY ./site/bugs4.jpg /var/www
COPY ./site/index.html /var/www  
COPY ./site/style.css /var/www
COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

