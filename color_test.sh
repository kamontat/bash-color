#!/bin/bash

if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
else
    echo "not support tput, use color_raw_constant.sh instead."
    exit 2
fi

function run {
    f=$1
    b=$2
    printf "$(tput setab $b)$(tput setaf $f)%s(b=%3d,f=%3d)$(tput sgr0)" "CODE" "$b" "$f"
}

function all {
    for ((i=0; i<=$ncolors; i++)); do
        for ((j=0; j<=$ncolors; j++)); do
            run $j $i
            [[ $(($j % 8)) -eq 0 ]] && echo ""
        done
    done
}

function fixed_f {
    for ((i=0; i<=$ncolors; i++)); do
        run $1 $i
        [[ $(($i % 8)) -eq 0 ]] && echo ""
    done
}

function fixed_b {
    for ((i=0; i<=$ncolors; i++)); do
        run $i $1
        [[ $(($i % 8)) -eq 0 ]] && echo ""
    done
}

fore=-1
back=-1
HELP="
Testing color, you must manually source color.
'none' option is mean log all possible color in your app/OS, 
beware this may very long 
availble options
    f - foreground color (use number to set)
    b - background color (use number to set)
----------------------------------------------
create by: Kamontat Chantrachirathumrong
version:   1.0.0
"

while getopts 'f:b:h' flag; do
    case "${flag}" in
        f) fore="$OPTARG" ;;
        b) back="$OPTARG" ;;
        h) echo "$HELP" && exit 0 ;;
    esac
done

if [[ $fore -lt 0 ]] && [[ $back -lt 0 ]]; then
    all
elif [[ $fore -ge 0 ]] && [[ $back -ge 0 ]]; then
    run $fore $back
    echo ""
elif [[ $fore -ge 0 ]]; then 
    fixed_f $fore
elif [[ $back -ge 0 ]]; then
    fixed_b $back
fi
