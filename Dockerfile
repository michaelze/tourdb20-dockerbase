FROM php:5.6.13-apache
MAINTAINER Michael Zender <michael@crazymonkeys.de>

RUN apt-get update && apt-get install -y \
        libicu-dev \
    && docker-php-ext-install \
         intl \
         mbstring \
         pdo_mysql

RUN a2enmod rewrite

CMD ["apache2-foreground"]
