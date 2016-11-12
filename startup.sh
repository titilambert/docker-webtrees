#!/bin/bash

mkdir -p /var/www/webtrees/data
chown www-data:www-data -R /var/www/webtrees/data

apache2 -DFOREGROUND
