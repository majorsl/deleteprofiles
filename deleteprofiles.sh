#!/bin/bash
# version 1.0.7
# This script will remove inactive accounts in OS X after a predetermined amount of time
# (currently set at 5 days.) Adjust mtime to change. Exclude users below:

save1="/Users/Shared" #Shared should never be removed.
save2="/Users/administrator"
save3="/Users/majorsl"

USERS=`find /Users -type d -maxdepth 1 -mindepth 1 -not -name "." -mtime +5`

for x in $USERS ; do
[[ "$x" == "$save1" ]] && continue #save account 1
[[ "$x" == "$save2" ]] && continue #save account 2
[[ "$x" == "$save3" ]] && continue #save account 3

echo "Removing account and Home: " $x

dscl . delete $x
rm -r $x

done
