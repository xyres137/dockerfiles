#!/bin/bash

set -e
source prep-script.sh

# $1: version-branch, $2: new-version, 3$: image
source commit.sh $1 $2 $3

