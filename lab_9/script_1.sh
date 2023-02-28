#!/bin/bash

printf "System Uptime:\n"
uptime -p
echo "------------------------------------------------------------"

printf "Inode Usage:\n"
df -i 2> /dev/null
echo "------------------------------------------------------------"

printf "Usage Statistics:\n"
memory_usage=$(free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
disk_usage=$(df -h 2> /dev/null | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}')
cpu_usage=$(top -bn1 | grep load | awk '{printf "CPU Usage: %.2f\n", $(NF-2)}')
cur_date=`date +%b_%d_%Y_%H_%M_%S`

echo "$cur_date: $memory_usage || $disk_usage || $cpu_usage"
echo "------------------------------------------------------------"

printf "Last 15 lines of /val/log/syslog:\n"
tail -15 /var/log/syslog
echo "------------------------------------------------------------"