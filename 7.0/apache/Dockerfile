FROM php:7.0-apache

MAINTAINER Di Zhang <zhangdi_me@163.com>

# Uncomment if you are in china.
# ADD 163.sources.list /etc/apt/sources.list

COPY php.ini /usr/local/etc/php/

RUN apt-get update && \
    # install intl
    apt-get install -y zlib1g-dev libicu-dev g++ && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    # install pdo pdo_mysq
    docker-php-ext-install pdo pdo_mysql && \
    # install gd
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd && \
    # install php zip
    docker-php-ext-install zip && \
    # install git
    apt-get install -y git && \
    # install composer
    curl -o composer https://getcomposer.org/composer.phar && \
    chmod +x composer && \
    mv composer /usr/local/bin/composer && \
    # cleanup
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*