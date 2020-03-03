##!/bin/bash
clear

## Backup Format
FORMAT=tgz

## Backup location
ZBACKUP=/srv/backup/

## Folder name for backup and using date
DATE=`date +"%d%m%y"`

## Backup location separate by date
ZDUMPDIR=$ZBACKUP/$DATE

## zmmailbox location
ZMBOX=/opt/zimbra/bin/zmmailbox

### Backup Option ###

## Based on few day ago until today, example 7 days ago

#HARI=`date --date='7 days ago' +"%m/%d/%Y"`
#query="&query=after:$HARI"

## Based on certain date , example 21 Jan 2015.

#query="&query=date:01/21/2015"

## Based from/to certain date. Example Backup Mailbox before 21 Jan 2015 and after 10 Jan 2015

#query="&query=after:01/10/2015 before:01/21/2015"

if [ ! -d $ZDUMPDIR ]; then
        mkdir -p $ZDUMPDIR
fi

## Looping Account Zimbra
for account in `su - zimbra -c 'zmprov -l gaa | sort'`
do
echo "Processing mailbox $account backup..."
        $ZMBOX -z -m $account getRestURL "//?fmt=${FORMAT}$query" > $ZDUMPDIR/$account.${FORMAT}
done

echo "Zimbra Mailbox backup has been completed successfully."
