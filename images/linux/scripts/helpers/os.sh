#!/bin/bash
################################################################################
##  File:  install-helpers.sh
##  Desc:  Helper functions for installing tools
################################################################################

function isUbuntu16
{
    lsb_release -d | grep -q 'Ubuntu 16'
}

function isUbuntu18
{
    lsb_release -d | grep -q 'Ubuntu 18'
}

function isUbuntu20
{
    lsb_release -d | grep -q 'Ubuntu 20'
}

function getOSVersionLabel
{
    lsb_release -cs
}

function preexec
{
    set +e

    ps -aux
    lsof /var/lib/apt/lists/lock

    APTPID=$(ps -ef  | grep "[a]pt" | awk '{ printf "%d ", $2 }')
    if [[ ! -z "$APTPID" ]]
    then
        for ONEPID in "${APTPID[@]}"
        do
            echo "apt/apt-get is running"
            lsof -p $ONEPID
            cat /proc/$ONEPID/cmdline
            ls /proc/$ONEPID/fd
        done
    else
        echo "apt/apt-get is not running"
    fi

    DPKGPID=$(ps -ef  | grep "[d]pkg" | awk '{ printf "%d ", $2 }')
    if [[ ! -z "$DPKGPID" ]]
    then
        for ONEPID in "${DPKGPID[@]}"
        do
            echo "apt/apt-get is running"
            lsof -p $ONEPID
            cat /proc/$ONEPID/cmdline
            ls /proc/$ONEPID/fd
        done
    else
        echo "apt/apt-get is not running"
    fi

    unset APTPID
    unset DPKGPID
}