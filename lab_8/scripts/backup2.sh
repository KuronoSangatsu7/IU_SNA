#!/bin/bash
backup_name=$1
dir_path=$2

cd /

sudo rm -rf backups2

mkdir -p backups2

cd backups2

cur_date=`date +%b_%d_%Y_%H_%M_%S`

sudo tar cpzf ${backup_name}_$cur_date.tar.gz $dir_path
