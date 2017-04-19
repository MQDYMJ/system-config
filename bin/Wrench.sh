#!/bin/bash

export EMACS=t
export ANDROID_SERIAL=$(select-output-line -p "Select the adb device" my-adb devices?|pn 1)
export LD_LIBRARY_PATH=/usr/local/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
# adb forward --remove tcp:28888

find-or-exec 'Wrench V%Wrench'

if test "$#" != 0; then
    if test $# = 1 -a -e "$1" && [[ $1 =~ \.(twa|lua)$ ]]; then
        exec Wrench "$(readlink -f "$1")"
    fi
fi

if test "$#" = 1 -a ! -e "$1"; then
    what_to_do=$1
elif sawfish-window-exists Wrench; then
    what_to_do=$(
        ask-for-input --history -a "Wrench" -p "你要小扳手的什么功能？（可以自己输入比如 baohaojun@@wx）"
              )
fi

if test "$what_to_do" = $'\003'; then
    exit
fi

if test "$what_to_do" -a "$what_to_do" != Wrench; then

    if [[ $what_to_do =~ \( ]]; then
        format=%s
    else
        format='t1_call([==[%s]==])'
    fi
    cat <<EOF |tee ~/.cache/system-config/wrench-$$.twa
-- -*- mode: lua -*-
-- {%lua%}
$(printf "$format" "$what_to_do")
-- {%/lua%}
EOF
    Wrench ~/.cache/system-config/wrench-$$.twa
    rm ~/.cache/system-config/wrench-$$.twa
else
    exec Wrench
fi
