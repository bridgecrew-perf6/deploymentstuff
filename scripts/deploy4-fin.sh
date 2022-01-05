#!/bin/bash
printf 'final stage'
rm -rf /var/www/html/build
echo '========='
cd /home/charles/server/
mkdir eatass
cp -r /home/charles/server/wikifront/build /var/www/html/build
cd /var/www/html
pm2 stop all
pm2 serve --spa build 5000
echo 'final stage done'
