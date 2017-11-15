#!/bin/bash

if [ ! -z $C_COMPLETE ]; then
    DEFAULT="C_"
    FORGROUND="FG_"
    BACKGROUND="BG_"

    unset C_BO
    unset C_DI
    unset C_UL
    unset C_RV
    unset C_SM
    unset C_BL
    unset C_IV

    # reset variable
    unset C_RE_AL
    unset C_RE_SM
    unset C_RE_UL

    for ((i=0; i<=$C_COMPLETE; i++)); do
        temp="$DEFAULT$FORGROUND$i"
        unset $temp

        temp="$DEFAULT$BACKGROUND$i"
        unset $temp
    done
fi

# reset useful function
debug() {
    echo "$1"
}

error() {
    echo "$1"
}

info() {
    echo "$1"
}

warning() {
    echo "$1"
}

alert() {
    echo "$1"
}

# export function
export -f debug
export -f error
export -f info
export -f warning
export -f alert

unset C_COMPLETE
