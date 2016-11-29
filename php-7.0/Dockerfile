FROM php:7.0-apache

MAINTAINER Di Zhang <zhangdi_me@163.com>

# Uncomment if you are in china.
# ADD 163.sources.list /etc/apt/sources.list

COPY config/php.ini /usr/local/etc/php/

# Update apt-get sources
RUN apt-get update 

# Install intl
RUN apt-get install -y zlib1g-dev libicu-dev g++ && \
  docker-php-ext-configure intl && \
  docker-php-ext-install intl

# Install pdo pdo_mysql
RUN docker-php-ext-install pdo pdo_mysql

# Install gd
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev && \
  docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
  docker-php-ext-install -j$(nproc) gd

# Install pecl install imagick
RUN apt-get install -y libmagickwand-dev && \
  pecl install imagick && \
  docker-php-ext-enable imagick

# Install PHP composer
RUN curl -o composer https://getcomposer.org/composer.phar && \
  chmod +x composer && \
  mv composer /usr/local/bin/composer

# Install git
RUN apt-get install -y git

# Clean up when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*