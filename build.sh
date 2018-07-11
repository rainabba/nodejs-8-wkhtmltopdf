#!/bin/sh
#set -x #echo on
CODE_VERSION=$(cat package.json | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[\",]//g' | tr -d '[[:space:]]')
docker build -t rainabba/nodejs-8-wkhtmltopdf:0.12.3-$CODE_VERSION .