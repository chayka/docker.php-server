#!/bin/bash
set -e

# setting TERM to be able to use mc or nano
export TERM=xterm

# a tweak to get mysql root password from mariadb
export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-$MYSQL_ENV_MYSQL_ROOT_PASSWORD}

# install phpmyadmin if not installed

chayka install-pma --db-host mysql

exec "$@"