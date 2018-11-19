#!/bin/bash
urls=$(cat urls)
nginxcerts=/usr/local/etc/nginx/certs

for url in $urls; 
	do
		purl=$(sed -e 's/[\/&]/\\&/g' <<< $url)
		sed 's/domainname/'$purl'/g' gen.sh > gen.sh.tmp && chmod 777 gen.sh.tmp && \
		sed 's/domainname/'$purl'/g' gen.conf > gen.conf.tmp && chmod 777 gen.conf.tmp && \
		echo $url && \
		sudo mkdir -p $nginxcerts/$url && \
		sudo ./gen.sh.tmp && \
		sudo rm gen.conf.tmp && \
		sudo rm gen.sh.tmp  
done
