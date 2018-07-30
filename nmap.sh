#!/bin/bash
#NMAP Scan based off of current ipaddress. Note that options 2 and 3 take a hella long time

currentipaddress=$(hostname -I | awk '{print $1}')
#Menu
PS3='Enter subnet: '
options=("/8" "/16" "/24" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"/8"):
		 scanrange=$(echo $currentipaddress | awk -F "." '{print $1 ".0.0.0/8" }'); 
		 echo $scanrange
		 break
		 ;;
		"/16")
		 scanrange=$(echo $currentipaddress | awk -F "." '{print $1"."$2 ".0.0/16"}');
		 echo $scanrange
		 break
		 ;;
		"/24")
		 scanrange=$(echo $currentipaddress | awk -F "." '{print $1"."$2"."$3 ".0/24"}'); 
		 echo $scanrange
		 break
		 ;;
		"Quit")
		 break
		 ;;
		*) echo invalid operation;;
	esac
done
echo "Your current IP address is:" $currentipaddress
echo "You've chosen to scan this range:" $scanrange
echo "Beginning Scan..."
activehosts=$(nmap -oG - ${scanrange} | awk '/Host:/ {print $2}' | sort -u)
echo "These are your active hosts: " $activehosts

