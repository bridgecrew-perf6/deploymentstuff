#!/bin/bash
cd /home/charles/server
pwd
sudo rm -rf wikifront
pwd
git clone git@github.com:pankajoa09/wikifront.git
cd wikifront
pwd
echo 'Installing packages ...'
npm install --save
echo 'Building ...'
npm run build
echo 'Removing previous build ...'
echo 'Copying new build to /var/www/html/ ...'
sudo cp -r build /var/www/html/build
cd /var/www/html
#sudo chown -r charles:charles build
echo 'Restarting service ...'
sudo pm2 stop all
echo 'Serving new build on port 5000 ...'
sudo pm2 serve --spa build 5000
echo '====================='

