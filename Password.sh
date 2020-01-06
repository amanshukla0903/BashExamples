#!/bin/bash
# /root/third file should contain username and password in user:password manner
for i in `cat /root/third` 
do
echo $i | chpasswd
done
