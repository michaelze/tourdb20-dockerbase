FROM docker.io/php:7.3.2-apache-stretch
MAINTAINER Michael Iseli <michael@crazymonkeys.de>

RUN apt-get update && \
    apt-get install -y \
        libicu-dev \
        libzip-dev && \
    docker-php-ext-install \
        intl \
        mbstring \
        pdo_mysql \
        zip && \
    apt-get remove -y \
        libicu-dev \
        libzip-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite
