#!/bin/bash

if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
else
    echo "not support tput, use color_raw_constant.sh instead."
    exit 2
fi

for ((i=0; i<=$ncolors; i++)); do
    printf "$(tput setaf $i)%s(%-3d) $(tput sgr0)" "CODE" "$i"
    if [[ $(($i % 8)) -eq 0 ]]; then
        echo ""
    fi
done
