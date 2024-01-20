#!/bin/bash

RED='\033[0;31m'
if [ $# -eq 0 ]; then
    echo "${RED} Usage: $0 <image> <newversion> <versionbranch> <pod-branch>"
    exit 1
fi

image=$1
newversion=$2
podbranch=$4

cd /work/pod/$image/ci/${image}
git checkout -B $podbranch

yq eval ".image.tag = \"$newversion\"" ./values.yaml -i

git add .
git commit -m "Bump $image helm chart tag to $newversion"
git push 