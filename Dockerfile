FROM docker.io/php:7.3.2-apache-stretch
MAINTAINER Michael Iseli <michael@crazymonkeys.de>

RUN apt-get update && \
    apt-get install -y \
        libicu-dev \
        libzip-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install \
        intl \
        mbstring \
        pdo_mysql \
        zip

RUN a2enmod rewrite
