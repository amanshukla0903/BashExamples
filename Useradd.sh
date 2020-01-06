#! /bin/bash

for i in `cat /root/userlist`
do
useradd $i
echo "User Added  $i"
done

