FROM docker.io/php:8.1-apache-bookworm
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
        pdo_mysql \
        bcmath \
        gd \
        zip && \
    pecl install imagick-3.7.0 && \
    docker-php-ext-enable imagick

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY tourdb-custom-settings.ini $PHP_INI_DIR/conf.d/

ENV PHP_INI_MEMORY_LIMIT=128 \
    PHP_INI_MAX_EXECUTION_TIME=30

RUN a2enmod rewrite
