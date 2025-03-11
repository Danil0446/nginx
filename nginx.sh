#!/bin/sh
apt-get update
 apt-get install nginx
systemctl enable --now nginx.service
cd /etc/nginx/sites-available.d/
touch site.conf
echo >> "server {
 listen 80;
  server_name localhost .local 10.0.2.11;

  access_log /var/log/nginx/access.log;
  error_log /var/log/nginx/error.log;

  location / {
    root /var/www/html/;
    autoindex on;
   }
}"
ln -s /etc/nginx/sites-available.d/site.conf /etc/nginx/sites-enabled.d/site.conf
mkdir -p /var/www/html && cd /var/www/html && touch index.html
echo >> "<html><body><h1>It works! Nginx</h1></body></html>"  /var/www/html/index.html
