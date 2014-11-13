#!/bin/sh
watchlog_script="script/*"
today=`date '+%Y%m%d'`
mkdir "$today"
echo $today watchlog > log.tmp
for file in $watchlog_script
do
echo ${file##*/}
    echo >> log.tmp
    ${file} > "${today}/${file##*/}.log"
    cat "${today}/${file##*/}.log" >> log.tmp
done
today=`date '+%Y/%m/%d'`
cat log.tmp|mail -s "[hw2] F74006307 tommy ${today}" root,hw.mike199250@gmail.com,tommy5198@gmail.com
rm log.tmp
