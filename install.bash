#!/bin/bash
cd "$(dirname "$0")"

chmod 755 ./color_constants.sh      # new version
chmod 755 ./color_raw_constants.sh  # old version

source ./color_constants.sh

exit_code=$?
if [ $exit_code -eq 2 ]; then
    exit 2
elif [ $exit_code -ne 0 ]; then
    echo "install wrong with some reason"
    exit $exit_code
fi

printf "\nDo you want to minify folder[Y|n]? "
read -n 1 ans
echo ""

if [[ $ans == "Y" ]]; then
    rm -rf ./README.md ./install.bash
fi

printf "${C_BG_5}${C_FG_7}complete!$C_RE\n"
