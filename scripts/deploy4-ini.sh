#!/bin/bash
echo 'initial phase'
cd /home/charles/server
mkdir eatassmyman
if [ -d wikifront ] ; then
    cd wikifront
    git pull
else
    rm -rf wikifront
    git clone git@github.com:pankajoa09/wikifront.git
    cd wikifront
fi
npm install --save
npm run build
echo 'done initial phase'

