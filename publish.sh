#!/bin/bash
echo on
CODE_VERSION=$(cat package.json | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[\",]//g' | tr -d '[[:space:]]')
docker push rainabba/nodejs-8-wkhtmltopdf:0.12.4-$CODE_VERSION
docker push rainabba/nodejs-8-wkhtmltopdf:latest