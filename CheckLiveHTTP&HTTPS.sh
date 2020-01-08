#!/bin/bash

while :
do
/usr/bin/netstat -tn 2>/dev/null | grep -e :80 -e :443 |sed -e '1,2d' | awk '{print $1"  " $4"  "$5"  "$6}' > /root/firstfile
echo -e "   |  \e[100m protocol \e[0m      |    \e[100m CON_IP  \e[0m         |     \e[100m  CLIENT_IP   \e[0m       |      \e[100m STATUS  \e[0m   | \n " > /root/myfile
while read LINE
do
#clear;
var1=$(echo $LINE | awk '{print $1}')
var2=$(echo $LINE | awk '{print $2}')
var3=$(echo $LINE | awk '{print $3}')
var4=$(echo $LINE | awk '{print $4}')
echo -e "   |   \e[34m $var1 \e[0m     |    \e[92m  $var2 \e[0m   |   \e[96m $var3 \e[0m    |  \e[7m $var4  \e[0m  |  \n " >> /root/myfile
done < /root/firstfile
clear;
cat /root/myfile
sleep 2
done
