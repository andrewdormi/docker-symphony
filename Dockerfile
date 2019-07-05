FROM php:5-fpm-alpine

RUN mkdir /app
WORKDIR /app

RUN apk update \
    && apk upgrade \
    && apk add git make nodejs nginx npm \
    && npm config set unsafe-perm true \
    && npm i -g uglify-js \
    && npm i -g less \
    && npm i -g uglifycss

RUN docker-php-ext-install mbstring pdo pdo_mysql

RUN cd /app && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"