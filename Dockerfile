FROM php:7.1.2-apache
MAINTAINER Michael Zender <michael@crazymonkeys.de>

RUN apt-get update && apt-get install -y \
        libicu-dev \
        zlib1g-dev \
        git \
    && docker-php-ext-install \
         intl \
         mbstring \
         pdo_mysql \
         zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir /usr/local/bin --filename composer \
    && php -r "unlink('composer-setup.php');"

RUN a2enmod rewrite

CMD ["apache2-foreground"]
