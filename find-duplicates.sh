#!/bin/bash

# Duplicate file finder

if [[ -z $1 ]]; then
    echo "usage: find-duplicates.sh <dir>; assuming current dir $(pwd)"
    DIR=$(pwd)
else
    DIR="$1"
fi

time find "${DIR}" -mount -type f -exec md5sum '{}' \; | sort | uniq -w32 --all-repeated=separate

exit $?
