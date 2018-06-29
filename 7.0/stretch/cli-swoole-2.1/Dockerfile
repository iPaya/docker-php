FROM ipaya/php-7.0:cli

MAINTAINER Di Zhang <zhangdi_me@163.com>
LABEL maintainer="zhangdi_me@163.com"

ENV SWOOLE_VERSION=2.1.3

RUN curl -fsSL https://github.com/swoole/swoole-src/archive/v{$SWOOLE_VERSION}.tar.gz -o swoole.tar.gz \
      && mkdir -p /tmp/swoole \
      && tar -xf swoole.tar.gz -C /tmp/swoole --strip-components=1 \
      && rm swoole.tar.gz \
      && docker-php-ext-configure /tmp/swoole \
      && docker-php-ext-install /tmp/swoole \
      && rm -r /tmp/swoole \
      # Clean up when done.
      && apt-get autoremove -y \
      && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*