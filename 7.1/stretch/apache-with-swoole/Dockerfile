FROM php:7.1-apache

# 安装 Swoole
RUN printf "\n\n\n\n" | pecl install swoole && docker-php-ext-enable swoole && pecl clear-cache
