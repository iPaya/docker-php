#!/usr/bin/env bash

BASE_PATH=$(cd `dirname $0`; pwd)

docker build -t ipaya/php-7.0:cli $BASE_PATH/7.0/stretch/cli/ \
&& docker build -t ipaya/php-7.0:apache $BASE_PATH/7.0/stretch/apache/ \
&& docker build -t ipaya/php-7.1:cli -f $BASE_PATH/7.1/stretch/cli/Dockerfile $BASE_PATH \
&& docker build -t ipaya/php-7.1:apache -f $BASE_PATH/7.1/stretch/apache/Dockerfile $BASE_PATH