#!/bin/bash

set -e
source prep-script.sh

image=$1
newversion=$2
versionbranch=$3
podbranch=$4

source commit.sh $image $newversion $versionbranch
source update-chart.sh  $image $newversion $versionbranch $podbranch