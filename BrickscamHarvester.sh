#!/bin/bash
set -e

echo "Enter your Shodan API key:"
read key
shodan init $key

echo "Enter output file name:"
read outputname

echo "Enter amount of cameras (free accounts up to 20):"
read amount

echo "Downloading list of Brickcom devices..."
shodan download --limit $amount temp.json.gz Brickcom

echo "Parsing downloaded list..."
shodan parse --fields ip_str,port --separator : temp.json.gz | rev | cut -c 2- | rev >> $outputname>&1
rm temp.json.gz

echo "DONE! Your list is in $outputname"
