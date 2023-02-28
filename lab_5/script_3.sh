#!/bin/bash
cur_date=`date +%b_%d_%Y_%H_%M_%S`

dir=./backups/home_backup_$cur_date/

mkdir -p $dir

cp -Rp $HOME $dir

cd ./backups

tar -zcvf home_backup_$cur_date.tar.gz home_backup_$cur_date

rm -rf ./home_backup_$cur_date

