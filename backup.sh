#!/bin/sh

tardir="/home/* /var/mail/* /etc/*"
bkdate=`date '+%Y%m%d'`
rmbkdate=`date -v -3d '+%Y%m%d'`
tar -zc -f "${bkdate}bkup.tar.gz" $tardir
echo "$rmbkdate"
if [ -e "${rmbkdate}bkup.tar.gz" ];then
    rm "${rmbkdate}bkup.tar.gz"
fi
