FROM php:5.4-apache

MAINTAINER Di Zhang <zhangdi_me@163.com>
LABEL maintainer="zhangdi_me@163.com"
ENV DOCUMENT_ROOT=/var/www/html

# Uncomment if you are in china.
ADD 163.sources.list /etc/apt/sources.list

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Install intl
RUN apt-get update \
  && apt-get install -y zlib1g-dev libicu-dev g++ \
  && docker-php-ext-configure intl \
  && docker-php-ext-install intl \
  # Clean up when done.
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install pdo pdo_mysql
RUN apt-get update \
  && docker-php-ext-install pdo pdo_mysql \
  # Clean up when done.
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install gd
RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd \
  # Clean up when done.
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install php zip
RUN apt-get update \
  && docker-php-ext-install zip \
  # Clean up when done.
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install mysql
RUN apt-get update \
  && docker-php-ext-install mysql \
  # Clean up when done.
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite