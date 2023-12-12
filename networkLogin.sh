#!/bin/zsh

connectToNetwork(){
    echo "Connecting to network"
    bitsrun login
}

while true
do
    networkStatus=$(bitsrun status | grep "bitsrun" | awk '{print $NF}')

    if [ "$networkStatus" = "online" ]; then
        # echo "Network is connected"
    elif [ "$networkStatus" = "offline" ]; then
        # echo "Network is not connected"
        connectToNetwork > /dev/null 2>&1
        sleep 1
    else
        echo "Unknown network status"
        # echo "$networkStatus"
    fi

done