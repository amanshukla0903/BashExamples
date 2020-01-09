#!/bin/bash
df -h | grep -vE '^Filesystem|tmpfs' | awk '{ print $5" "$1 }' | while read output;
do
usep=$(echo $output | awk '{ print $1 }' | cut -d'%' -f1)
partition=$(echo $output | awk '{ print $2 }')

if [ $usep -ge 10 ];
then
echo " $HOSTNAME is out of storage...  $partition size is $usep"
fi
done
