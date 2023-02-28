#!/bin/bash

cd /

sudo rm -rf backups3

mkdir -p backups3

cd backups3

cur_date=`date +%b_%d_%Y_%H_%M_%S`

sudo tar cpzf nginx_backup_$cur_date.tar.gz /var/www/html
