#!/bin/bash

hardware=""

sudo ip link set dev wlo1 down
# shuts down wifi
if [ -z "$1" ]; 
then 
    echo "No mac address provided, assigning default value."
    sudo ip link set dev wlo1 address 00:1d:98:5a:d1:d3;
    
    # if program was not run with an argument, assign this mac address
else 
    if [ "$1" == 0 ]; 
    then 
        echo "Resetting mac address."
        sudo ip link set dev wlo1 address $hardware;
        # if program was run with "0" as an argument, assign hardware mac address 
    else
        string=$1
        mac=${string:0:2}:${string:2:2}:${string:4:2}:${string:6:2}:${string:8:2}:${string:10:2}
        sudo ip link set dev wlo1 address $mac;
        echo "New mac address is $mac."
        # if program was run with a string, use that string as mac address
    fi
fi
sudo ip link set dev wlo1 up
# start up wifi