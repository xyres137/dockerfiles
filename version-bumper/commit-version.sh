#!/bin/bash

RED='\033[0;31m'
if [ $# -eq 0 ]; then
    echo "${RED} Usage: $0 <image> <newversion>"
    exit 1
fi

image=$1
newversion=$2

cd /work/version

git checkout "$image" -- 
echo "$newversion" > "$image"
git add .
git commit -m "Bump $image to version $newversion"
git push 