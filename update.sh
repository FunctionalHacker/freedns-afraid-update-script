#!/bin/bash

######## EDIT THESE VARIABLES TO MATCH YOUR CONFIGURATION #############################
domain="***YOUR DOMAIN***"
updateurl="***YOUR UPDATE URL***"
# You can get the update url by going to http://freedns.afraid.org/dynamic/v2/
# and copying the link under your domain that starts with http://sync.afraid.org/u/...
#######################################################################################

registered=$(nslookup $domain|tail -n2|grep A|sed s/[^0-9.]//g)
current=$(curl -s http://checkip.dyndns.org|sed s/[^0-9.]//g)

if [ "$current" != "$registered" ]; then                           
	curl -s >> /dev/null $updateurl
	echo "The DNS record of $domain was updated to $current from $registered"
else
	echo "DNS record up to date"
fi

# Check the cron example on this repository to see how you can run this automatically
