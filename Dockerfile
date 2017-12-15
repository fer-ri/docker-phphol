FROM php:5.6-fpm

MAINTAINER Ferri Sutanto <greenhouseprod@gmail.com>

RUN apt-get update && apt-get upgrade -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpq-dev \
    libmagickwand-dev \
    libmcrypt-dev \
    libmcrypt-dev \
    libpng12-dev \
    libmemcached-dev \
    libssl-dev \
    libssl-doc \
    libsasl2-dev \
    zlib1g-dev \
    && docker-php-ext-install \
        bz2 \
        iconv \
        mbstring \
        mcrypt \
        mysql \
        mysqli \
        pdo \
        pdo_mysql \
        zip \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && pecl install mongo && docker-php-ext-enable mongo \
    && pecl install apcu-4.0.11 && docker-php-ext-enable apcu \
    && php -r "readfile('http://getcomposer.org/installer');" | \
        php -- --install-dir=/usr/local/bin/ --filename=composer \
    && mkdir -p /.composer \
    && chmod -R ugo+rw /.composer \
    && usermod -u 1000 www-data

COPY php.ini /usr/local/etc/php/conf.d/php.ini