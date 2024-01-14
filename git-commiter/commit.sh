#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <version-branch> <new-version> <image>"
    exit 1
fi

cd /work/version
git checkout $1
echo "$2" > $3
git add .
git commit -m "Bump $3 to version $2"
git push 