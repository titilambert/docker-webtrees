#!/bin/bash

mkdir -p /var/www/webtrees/data
chown www-data:www-data -R /var/www/webtrees/data

source /etc/apache2/envvars
apache2 -DFOREGROUND
