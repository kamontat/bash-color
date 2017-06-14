#!/bin/bash

VERS="v3"

CONS="https://github.com/kamontat/bash-color/releases/download/$VERS/color_constants.sh"

RESET="https://github.com/kamontat/bash-color/releases/download/$VERS/reset.sh"

[[ $# -ne 1 ]] && echo "expected 1 parameter, got $#" && exit 1

function load {
    curl -sL -N "$1"
}

if [[ $1 = "load" ]]; then
    # echo "load"
    [ -f ./color_constants.sh ] && cat ./color_constants.sh || echo "$(load $CONS)"
elif [[ $1 = "reset" ]]; then
    # echo "reset"
    [ -f ./reset.sh ] && cat ./reset.sh || echo "$(load $RESET)"
fi
