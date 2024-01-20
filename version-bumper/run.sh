#!/bin/bash

set -e
source prep-script.sh

image=$1
newversion=$2
versionbranch=$3
podbranch=$4

source /root/commit-version.sh $image $newversion $versionbranch
source /root/update-chart.sh  $image $newversion $versionbranch $podbranch