#!/bin/sh

echo "------- Setuid Diffs -------"
MP=`mount -t ufs,zfs | awk '$0 !~ /no(suid|exec)/ { print $3 }'`
find -sx $MP /dev/null -type f \
         \( -perm -u+x -or -perm -g+x -or -perm -o+x \) \
         \( -perm -u+s -or -perm -g+s \) -exec ls -liTd \{\} \+ |
         cat > setuid.tmp
if [ ! -f setuid.today ];then
    mv setuid.tmp setuid.today
else
    diff -b -u setuid.tmp setuid.today
    mv setuid.today setuid.yesterday
    mv setuid.tmp setuid.today
fi

echo "----------------------------"
