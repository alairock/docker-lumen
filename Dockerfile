FROM alpine:latest

MAINTAINER Skyler Lewis <sblnog@gmail.com>

RUN apk --update add wget curl git php php-curl php-openssl php-pdo php-json php-phar php-dom php-zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

ENV COMPOSER_HOME /root/composer

ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

RUN composer global require "laravel/lumen-installer"

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]
