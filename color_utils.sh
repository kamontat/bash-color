#!/usr/bin/env bash

LOCATION="$(dirname "$0")"

CONSTANTS_FILE="color_constants.sh"
RESET_FILE="color_reset.sh"

VERSION="v4.5.0"

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

if [[ $1 = "load" || $1 = "l" ]]; then
    file="$LOCATION/$CONSTANTS_FILE"
    [ ! -f "$file" ] && load "$CONS"
elif [[ $1 = "remove" || $1 = "r" ]]; then
    file="$LOCATION/$RESET_FILE"
    [ ! -f "$file" ] && load "$RESET"
elif [[ $1 = "clear" || $1 = "c" ]]; then
    [ -f "$LOCATION/$CONSTANTS_FILE" ] && rm -f "$LOCATION/$CONSTANTS_FILE"
    [ -f "$LOCATION/$RESET_FILE" ] && rm -f "$LOCATION/$RESET_FILE"
    exit 0
elif [[ $1 = "test" || $1 = "t" ]]; then
    file="$LOCATION/$CONSTANTS_FILE"
    [ ! -f "$file" ] && load "$CONS"
    $file test
    exit 0
elif [[ $1 = "version" || $1 = "v" ]]; then
    echo "$VERSION"
    exit 0
elif [[ $1 = "help" || $1 = "h" ]]; then
    echo "
description: accept 1 parameter with optional version number
usage: 'source /dev/stdin <<<(./color_utils.sh <paramter> <version>) &>/dev/null'
  >> parameters
      1. load    | l - load color in bash
        - @params 1 - version number (tag in github 'https://github.com/kamontat/bash-color/releases')
      2. remove  | r - remove color from bash
        - @params 1 - version number (tag in github 'https://github.com/kamontat/bash-color/releases')
      3. clear   | c - clear cache from system
      4. test    | t - run test command (check is color loaded?)
      5. version | v - get current `bash-color` version
      6. help    | h - help command
    "
    exit 0
fi

[ -f "$file" ] && cat "$file" || exit 2
