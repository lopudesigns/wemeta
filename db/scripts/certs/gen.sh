#!/bin/bash
nginxcerts=/usr/local/etc/nginx/certs
openssl req -x509 -nodes -days 0 -newkey rsa:2048 -keyout $nginxcerts/domainname/key.pem -out $nginxcerts/domainname/crt.pem -config gen.conf.tmp -sha256
