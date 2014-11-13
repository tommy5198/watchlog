#!/bin/sh

today=`date '+%b %d'`
echo "-------- User Login --------"
last | grep "$today"
echo "----------------------------"
