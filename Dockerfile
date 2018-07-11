FROM node:8.11.3

# Dockerfile author / maintainer
MAINTAINER Michael Richardson <rainabba@gmail.com>

### Cleanup and instal build tools
### Standardize container timezone
RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y build-essential wget libc6 \
  && npm install -g -y npm@6.1.0 \
  && npm install -g -y grunt bower nodemon forever \
  && echo "Standardize container time" \
  && echo "America/Phoenix" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata \
  && update-ca-certificates --fresh \
  && apt-cache policy ca-certificates;

RUN apt-get install -y vim \
  && mkdir -p /tmp/src \
  && cd /tmp/src \
  && wget -O wkhtmltox-0.12.3_linux-generic-amd64.tar.xz https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz \
  && tar xf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz \
  && cp -R wkhtmltox/* /usr/local/;
