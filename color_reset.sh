#!/bin/bash

if [ ! -z $C_COMPLETE ]; then
    DEFAULT="C_"
    FORGROUND="FG_"
    BACKGROUND="BG_"

    C_BO=""
    C_DI=""
    C_UL=""
    C_RV=""
    C_SM=""
    C_BL=""
    C_IV=""

    # reset variable
    C_RE_AL=""
    C_RE_SM=""
    C_RE_UL=""

    for ((i=0; i<=$C_COMPLETE; i++)); do
        temp="$DEFAULT$FORGROUND$i"
        declare $temp=""

        temp="$DEFAULT$BACKGROUND$i"
        declare $temp=""
    done
fi

export C_COMPLETE=
