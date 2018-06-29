FROM php:7.0-cli

MAINTAINER Di Zhang <zhangdi_me@163.com>
LABEL maintainer="zhangdi_me@163.com"

RUN echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib\n\
deb http://mirrors.163.com/debian/ stretch-proposed-updates main non-free contrib\n\
" > /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y \
    zlib1g-dev \
    libicu-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install opcache \
    # 移除不需要的包
    && apt-get remove -y zlib1g-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && apt-get autoremove -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*