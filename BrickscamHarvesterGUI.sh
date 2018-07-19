#! /bin/bash
text="BrickscamHarvester by EMLGaming &amp; M00SE"
eval $(yad --name=BrickscamHarvester --text-align="CENTER" --window-icon="logo.png" --title=BrickscamHarvester --text="$text" \
--width=400 --form --field=APIkey --field=Outputfile:SFL \
"" "" | awk -F'|' '{printf "APIkey=\"%s\"\nOUTPUT=\"%s\"\n", $1, $2}')
[[ -z $APIkey || -z $OUTPUT ]] && exit 1

Amount="$(yad --name=BrickscamHarvester --title=BrickscamHarvester --window-icon="logo.png" \
--text="Amount of cameras: " --width=400 --scale --max-value=1000)"

shodan init $APIkey
shodan download --limit $Amount temp.json.gz Brickcom
shodan parse --fields ip_str,port --separator : temp.json.gz | rev | cut -c 2- | rev >> $OUTPUT>&1
printf "\nConverting temp.json.gz to $OUTPUT"
printf "\nRemoving temp.json.gz"
rm temp.json.gz
printf "\nDONE! Your list is in $OUTPUT\n"

exit