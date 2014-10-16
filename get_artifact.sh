#!/bin/bash

# just a demonstration of grabbing a build artifcat from CircleCI

BUILDNUMBER=$1
project=$2
CircleCIAPIToken=$3
FileName=$4
account_name=$5

echo "**************************************"
echo "buildNumber=${BUILDNUMBER}"
echo "project:${project}"
echo "CircleCIAPIToken:${CircleCIAPIToken}"
echo "FileName:${FileName}"
echo "**************************************"
echo ""
echo "Retrieving:  $FileName"
artifactUrl=$(curl -s https://circleci.com/api/v1/project/${account_name}/${project}/${BUILDNUMBER}/artifacts?circle-token=${CircleCIAPIToken} -H "Accept: application/json" | jq -r --arg file ${FileName} '.[].url | select(contains($file))')
echo ""
echo  "${artifactUrl}"

wget --no-verbose -O "$FileName"  "${artifactUrl}?circle-token=${CircleCIAPIToken}"
