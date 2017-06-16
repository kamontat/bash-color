#!/bin/bash

LOCATION="$(dirname $0)"

VERS="v4.2"

CONS="https://github.com/kamontat/bash-color/raw/$VERS/color_constants.sh"
RESET="https://github.com/kamontat/bash-color/raw/$VERS/color_reset.sh"

[[ $# -ne 1 ]] && echo "expected 1 parameter, got $#" && exit 1

function load {
    name="$(get_name_from_url $1)"
    context="$(curl -sL -N $1)"
    echo "$context" >> $LOCATION/$name
    echo "$context"
}

function get_name_from_url {
    echo "${1##*/}"
}

if [[ $1 = "load" ]]; then
    [ -f $LOCATION/color_constants.sh ] && cat $LOCATION/color_constants.sh || echo "$(load $CONS)"
elif [[ $1 = "clear" ]]; then
    [ -f $LOCATION/color_reset.sh ] && cat $LOCATION/color_reset.sh || echo "$(load $RESET)"
elif [[ $1 = "delete" ]]; then
    [ -f $LOCATION/color_constants.sh ] && rm -f $LOCATION/color_constants.sh
    [ -f $LOCATION/color_reset.sh ] && rm -f $LOCATION/color_reset.sh
fi