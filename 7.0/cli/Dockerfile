FROM php:7.0-cli

MAINTAINER Di Zhang <zhangdi_me@163.com>
LABEL maintainer="zhangdi_me@163.com"

RUN echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib\n\
deb http://mirrors.163.com/debian/ stretch-proposed-updates main non-free contrib\n\
" > /etc/apt/sources.list

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
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  # Clean up when done.
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install php zip
RUN apt-get update \
  && docker-php-ext-install zip \
  # Clean up when done.
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install php opcache
RUN apt-get update \
  && docker-php-ext-install opcache \
  # Clean up when done.
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*