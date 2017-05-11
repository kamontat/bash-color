#!/bin/bash
cd "$(dirname "$0")"

chmod 755 ./color_constants
chmod 755 ./tester
chmod 755 ./example_usage

printf "Do you want to test[Y|n]? "
read -n 1 ans

if [[ $ans == "Y" ]]; then
    ./tester
fi

printf "Do you want to delete git[Y|n]? "
read -n 1 ans

if [[ $ans == "Y" ]]; then
    sudo rm -rf .git 
fi

source ./color_constants
echo ""
printf "$BLINK_RED \bcomplete!$RESET\n"
