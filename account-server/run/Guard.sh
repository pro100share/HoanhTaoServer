#!/bin/bash

g_program=$1
g_param1=$2
g_param2=$3
g_restart_num=10

Check()
{
    found=`ps | grep "$g_program" | grep -v "grep" | wc -l`
    if [ $found -eq 1 ]; then
        return 0
    else
        return 1
    fi
}

Main()
{
    if [ -z "$g_program" ]; then
        echo "没有输入目标程序"
        return 0
    fi

    while [ $g_restart_num -gt 0 ]; do
        Check
        ret=$?
        if [ $ret -eq 1 ]; then
            exec ./"$g_program" "$g_param1" "$g_param2" &
            g_restart_num=$(expr $g_restart_num - 1)
        fi
        sleep 1
    done
}

Main
