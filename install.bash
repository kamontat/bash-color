#!/bin/bash

cd dir $(dirname "$0")"

chmod 755 ./color
chmod 755 ./color_test

printf "do you want to test[Y|n]? "
read ans
if [[ ans == "Y" ]]; then 
  ./color_test
fi