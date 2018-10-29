FROM php:7.1-cli

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
    libpcre3 libpcre3-dev \
    libmcrypt-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install opcache \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install mcrypt \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /tmp/ \
    && curl -o composer.phar https://getcomposer.org/download/1.6.5/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer

# 时区
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone
