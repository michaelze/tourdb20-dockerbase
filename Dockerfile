FROM docker.io/php:7.2.15-apache-stretch
MAINTAINER Michael Iseli <michael@crazymonkeys.de>

RUN apt-get update && \
    apt-get install -y \
        imagemagick \
        libmagickwand-dev \
        libmagickcore-dev \
        libicu-dev \
        libzip-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install \
        intl \
        mbstring \
        pdo_mysql \
        zip && \
    pecl install imagick-3.4.3 && \
    docker-php-ext-enable imagick

RUN a2enmod rewrite

