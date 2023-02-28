#!/bin/bash

cur_date=`date +%b_%d_%Y_%H_%M_%S`

mkdir -p /var/log/sna_cron.log
echo "$cur_date Run at 10:10 on weekdays" >> /var/log/sna_cron.log
