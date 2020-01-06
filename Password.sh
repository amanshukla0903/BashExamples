#!/bin/bash

for i in `cat /root/third`
do
echo $i | chpasswd
done
