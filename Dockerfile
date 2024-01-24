FROM fedora

MAINTAINER  Serge varnavsky <sergei.varnavsky@mail.ru>

ENV TZ=Europe/Moscow

RUN dnf update -y
RUN dnf install -y nginx php php-fpm php-mysqli
RUN dnf clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /run/php-fpm

COPY ./html/ /user/share/nginx/html/

CMD php-fpm -D ; nginx

EXPOSE 80
