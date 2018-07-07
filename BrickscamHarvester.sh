#! /bin/bash

printf "\nEnter your Shodan API key: \n"
read key
shodan init $key

printf "\nOutput file name: \n"
read outputname
printf "\nAmount of cameras \n"
read amount
shodan download --limit $amount temp.json.gz Brickcom

shodan parse --fields ip_str,port --separator : temp.json.gz | rev | cut -c 2- | rev >> $outputname>&1
printf "\nConverting temp.json.gz to $outputname"
printf "\nRemoving temp.json.gz"
rm temp.json.gz
printf "\nDONE! Your list is in $outputname\n"

exit
