#!/bin/bash
echo -E "Username: $LOGNAME"
echo -E "Home Directory: $HOME"
echo -E "Shell: $SHELL"
echo -E "Hostname: $HOSTNAME"
ipaddress=`ip a | awk 'NR==3, /inet/ {print $2}'`
echo -E "IP address: $ipaddress"
