#!/bin/bash

######## EDIT THESE VARIABLES TO MATCH YOUR CONFIGURATION #########
								  #
domain="***YOUR DOMAIN***"					  #
								  #
updateurl="***YOUR UPDATE URL***"				  #
# You can get this by going to http://freedns.afraid.org/dynamic/ #
# and copying the "Direct URL" link				  #
								  #
###################################################################

registered=$(nslookup $domain|tail -n2|grep A|sed s/[^0-9.]//g)
current=$(wget -q -O - http://checkip.dyndns.org|sed s/[^0-9.]//g)

if [ "$current" != "$registered" ]; then                           
	wget -q -O /dev/null $updateurl
	echo "The DNS record of $domain was updated to $current from $registered"
else
	echo "DNS record up to date"
fi
