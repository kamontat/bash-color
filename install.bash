#!/bin/bash
cd "$(dirname "$0")"

chmod 755 ./color_constants
chmod 755 ./tester

printf "do you want to test[Y|n]? "
read ans

if [[ $ans == "Y" ]]; then
    ./tester
fi
echo "complete!"