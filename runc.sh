#!/bin/sh

set -xe

if [ $1 = "" ]; then
    exit 1
fi

date=$(date +%s)
filename=/tmp/runc_${date}
gcc -o $filename $1
$filename
rm $filename
