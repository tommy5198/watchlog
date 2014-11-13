#!/bin/sh

today=`date '+%b %d'`
echo "------- Failed Login -------"
cat /var/log/auth.log | grep "for invalid" | grep "$today" | awk -F' ' '{print $1" "$2" "$3" "$11" "$12" "$13}'
echo "----------------------------"
