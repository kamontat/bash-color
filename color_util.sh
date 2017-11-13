#!/usr/bin/env bash

LOCATION="$(dirname "$0")"

CONSTANTS_FILE="color_constants.sh"
RESET_FILE="color_reset.sh"

VERSION="v4.4"

[ -n "$2" ] && VERSION="$2"

CONS="https://github.com/kamontat/bash-color/raw/$VERSION/$CONSTANTS_FILE"
RESET="https://github.com/kamontat/bash-color/raw/$VERSION/$RESET_FILE"

[[ $# -ne 1 && $# -ne 2 ]] && echo "expected 1 or 2 parameter, got $#" && exit 1

function load {
    name="$LOCATION/$(get_name_from_url "$1")"
    curl -sLo "$name" "$1"
    chmod 755 "$name"
}

function get_name_from_url {
    echo "${1##*/}"
}

file=

if [[ $1 = "load" || $1 = "li" ]]; then
    file="$LOCATION/$CONSTANTS_FILE"
    [ ! -f "$file" ] && load "$CONS"
elif [[ $1 = "remove" || $1 = "rm" ]]; then
    file="$LOCATION/$RESET_FILE"
    [ ! -f "$file" ] && load "$RESET"
elif [[ $1 = "clear" || $1 = "cl" ]]; then
    [ -f "$LOCATION/$CONSTANTS_FILE" ] && rm -f "$LOCATION/$CONSTANTS_FILE"
    [ -f "$LOCATION/$RESET_FILE" ] && rm -f "$LOCATION/$RESET_FILE"
    exit 0
elif [[ $1 = "help" || $1 = "h" ]]; then
  echo "
color utils: accept 2 parameters
  >> parameters
    1. action
      - load   | li
      - remove | rm
      - clear  | cl
      - help   | h
    2. version number
      - get from tag in github 'https://github.com/kamontat/bash-color/releases'
  "
  exit 0
fi

[ -f "$file" ] && source "$file" || exit 2
