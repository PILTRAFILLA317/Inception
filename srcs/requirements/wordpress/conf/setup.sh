#!/bin/bash

mkdir -p /var/www/html/
chmod 777 /var/www/html/
cd /var/www/html
rm -rf *
wp core download --locale=es_ES --allow-root