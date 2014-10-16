#!/bin/bash

set -e

# just a demonstration of grabbing a build artifcat from CircleCI

#jenkins should define these vars
#BUILDNUMBER=
#project=
#CircleCIAPIToken=
#FileName=
#account_name=
#DestPath
#Unzip= (true|false, as a string)

echo "**************************************"
echo "buildNumber=${BUILDNUMBER}"
echo "project:${project}"
echo "CircleCIAPIToken:${CircleCIAPIToken}"
echo "FileName:${FileName}"
echo "DestPath:${DestPath}"
echo "Unzip:${Unzip}"
echo "**************************************"
echo ""
echo "Retrieving:  $FileName"
artifactUrl=$(curl -s https://circleci.com/api/v1/project/${account_name}/${project}/${BUILDNUMBER}/artifacts?circle-token=${CircleCIAPIToken} -H "Accept: application/json" | jq -r --arg file ${FileName} '.[].url | select(contains($file))')
echo ""
echo  "${artifactUrl}"

curl -s -o "$DestPath/$FileName"  "${artifactUrl}?circle-token=${CircleCIAPIToken}"
wait

if [ "$Unzip" == "true" ]
then
  unzip "$DestPatah/$FileName"
fi
