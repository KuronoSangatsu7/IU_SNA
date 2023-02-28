#!/bin/bash

cur_date=`date +%b_%d_%Y_%H_%M_%S`

mkdir -p /var/log/sna_cron.log
echo "$cur_date Run at 04:00 every Monday" >> /var/log/sna_cron.log
