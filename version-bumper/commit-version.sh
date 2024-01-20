#!/bin/bash

RED='\033[0;31m'
if [ $# -eq 0 ]; then
    echo "${RED} Usage: $0 <image> <newversion> <versionbranch>"
    exit 1
fi

image=$1
newversion=$2
versionbranch=$3


cd /work/version
git checkout $versionbranch
echo "$newversion" > $image
git add .
git commit -m "Bump $image to version $newversion"
git push 