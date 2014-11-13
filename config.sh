#!/bin/sh
if [ $# -ne 1 ];then
    echo "usage: config.sh init"
    echo "       config.sh remove"
fi

dir=`pwd`
if [ "$1" = "init" ];then
    crontmp=`mktemp -t mycron`
    crontab -l > ${crontmp}
    echo "0 0 * * * ${dir}/watchlog.sh" >> ${crontmp}
    echo "0 0 * * * ${dir}/backup.sh" >> ${crontmp}
    crontab ${crontmp}
    rm $crontmp
elif [ "$1" = "remove" ];then
    crontmp=`mktemp -t mycron`
    crontab -l | grep -v 'watchlog' > ${crontmp}
    crontab ${crontmp}
    cat ${crontmp}
    rm ${crontmp}
fi

