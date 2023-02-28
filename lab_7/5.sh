#!/bin/bash
trap "echo Interrupt received" SIGUSR1

while :
do
	echo "Hello world!"
	sleep 10
done