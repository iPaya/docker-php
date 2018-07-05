#!/usr/bin/env bash

docker push ipaya/php-7.0:cli \
&& docker push ipaya/php-7.0:apache \
&& docker push ipaya/php-7.1:cli \
&& docker push ipaya/php-7.1:apache