#!/bin/sh
watchlog_script="script/*"
for file in $watchlog_script
do
    eval ${file}
done


