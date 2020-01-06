#! /bin/bash

for i in `cat /root/userlist`
do
useradd $i
echo "User Added & Password set for $i"
done

