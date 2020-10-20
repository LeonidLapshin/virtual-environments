preexec() {
    set +e
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