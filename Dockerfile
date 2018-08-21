FROM node:8.11.3 

# Dockerfile author / maintainer 
MAINTAINER Michael Richardson <rainabba@gmail.com> 

### Cleanup and instal build tools
### Standardize container timezone
RUN apt-get update -y; \ 
apt-get upgrade -y; \ 
apt-get install -y locales build-essential wget libc6; \ 
locale-gen "en_US.UTF-8"; \ 
echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale; \ 
echo "America/Phoenix" > /etc/timezone; \ 
dpkg-reconfigure -f noninteractive tzdata; \ 
npm install -g -y npm@6.1.0; \ 
npm install -g -y grunt bower nodemon forever; \ 
update-ca-certificates --fresh; \ 
apt-cache policy ca-certificates; \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \ 
echo "deb http://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list; \ 
apt-get update -y; \
apt-get install -y yarn;

RUN mkdir -p /tmp/src; \ 
cd /tmp/src; \ 
wget -O wkhtmltox-0.12.4_linux-generic-amd64.tar.xz https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz; \ 
tar xf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz; \ 
cp -R wkhtmltox/* /usr/local/; 
