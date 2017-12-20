FROM php:7.1-fpm

## Update Ubuntu
RUN apt-get update

## Base config
RUN apt-get install -y autoconf pkg-config libssl-dev

## General
RUN docker-php-ext-install opcache \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mbstring

## mcrypt
RUN apt-get install -y libmcrypt-dev \
    && docker-php-ext-install mcrypt

## GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

## MongoDB
RUN pecl install mongodb

