FROM ipaya/base:latest

MAINTAINER Di Zhang <zhangdi_me@163.com>

EXPOSE 80

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y build-essential autoconf git supervisor libxml2-dev libcurl4-gnutls-dev libjpeg-dev libpng12-dev libfreetype6-dev libgmp-dev libc-client2007e-dev libicu-dev \
    libmcrypt-dev libpspell-dev libreadline-dev libtidy-dev libxslt1-dev

RUN apt-get install -y apache2 apache2-utils apache2-dev apache2-mpm-prefork && \
    a2enmod rewrite && \
    a2dismod mpm_event && \
    a2enmod mpm_prefork

ENV PHP_VERSION 7.0.12
ENV PHP_HOME /opt/php
ENV BIN_PATH /opt/bin

RUN mkdir -p /opt/src/php && \
    mkdir -p $BIN_PATH && \
    mkdir -p /etc/php/conf.d && \
    mkdir -p $PHP_HOME/php-$PHP_VERSION && \
    cd /opt/src/php && \
    wget http://cn2.php.net/distributions/php-$PHP_VERSION.tar.gz && \
    tar xzf php-$PHP_VERSION.tar.gz && \
    cd php-$PHP_VERSION && \
    ln -s /usr/lib/x86_64-linux-gnu/libssl.so  /usr/lib  && \
    ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

RUN cd /opt/src/php/php-$PHP_VERSION && \
     ./configure --prefix="$PHP_HOME/php-$PHP_VERSION" \
    --with-apxs2=/usr/bin/apxs2  \
    --enable-zend-signals  \
    --with-gd  \
    --with-jpeg-dir=/usr  \
    --with-png-dir=/usr  \
    --with-freetype-dir=/usr  \
    --enable-gd-native-ttf  \
    --enable-exif  \
    --with-config-file-path=/etc/php  \
    --with-config-file-scan-dir=/etc/php/conf.d  \
    --with-mysql-sock=/var/run/mysqld/mysqld.sock  \
    --with-zlib  \
    --enable-phpdbg  \
    --with-gmp  \
    --with-zlib-dir=/usr  \
    --with-gettext  \
    --with-kerberos  \
    --with-imap-ssl  \
    --with-mcrypt=/usr/local  \
    --with-iconv  \
    --enable-sockets  \
    --with-openssl  \
    --with-pspell  \
    --with-pdo-mysql=mysqlnd  \
    --with-pdo-sqlite  \
    --with-pgsql  \
    --with-pdo-pgsql  \
    --enable-soap  \
    --enable-xmlreader  \
    --enable-phar=shared  \
    --with-xsl  \
    --enable-ftp  \
    --enable-cgi  \
    --with-curl=/usr  \
    --with-tidy  \
    --with-xmlrpc  \
    --enable-mbstring  \
    --enable-sysvsem  \
    --enable-sysvshm  \
    --enable-shmop  \
    --with-readline  \
    --enable-pcntl  \
    --enable-fpm  \
    --enable-intl  \
    --enable-zip  \
    --with-imap  \
    --with-mysqli=mysqlnd  \
    --enable-calendar  \
    --enable-bcmath  \
    --enable-opcache-file && \
    make && make install

RUN cp /opt/src/php/php-${PHP_VERSION}/php.ini-production /etc/php/php.ini

RUN echo "AddType application/x-httpd-php .php \n\
AddType application/x-httpd-php .html \n\
AddType application/x-httpd-php .php .phtml .php3 .php4 \n\
AddType application/x-httpd-php-source .phps \n\
" > /etc/apache2/conf-available/php7.conf && \
    ln -s /etc/apache2/conf-available/php7.conf /etc/apache2/conf-enabled/php7.conf && \
    echo "; configuration for php common module \n\
; priority=20 \n\
extension=phar.so \n\
" > /etc/php/conf.d/20-phar.ini

ENV PATH "$PATH:$BIN_PATH:$PHP_HOME/php-$PHP_VERSION/bin:$PHP_HOME/php-$PHP_VERSION/sbin"

RUN mkdir -p /var/run/sshd /var/log/supervisor /var/lock/apache2 /var/run/apache2

RUN cd $BIN_PATH && \
    wget https://getcomposer.org/composer.phar && \
    chmod +x composer.phar && \
    mv composer.phar composer

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD 000-default.conf /etc/apache2/sites-available/000-default.conf

CMD ["/usr/bin/supervisord"]

# Clean up when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*