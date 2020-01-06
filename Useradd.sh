#! /bin/bash
# /root/userlist file should contains list of Users which should add
for i in `cat /root/userlist`
do
useradd $i
echo "User Added  $i"
done

