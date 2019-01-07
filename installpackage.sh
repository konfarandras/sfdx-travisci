#!/bin/bash
set -x
DESCRIPTION=testdescription
DEVHUB=DevHub
PACKAGENAME=testpackage
TARGET=MyTP
KEY=keyunicon19

echo starting installation of package...

#sfdx force:package:create --name $PACKAGENAME --description $DESCRIPTION --packagetype Unlocked --path force-app --nonamespace --targetdevhubusername $DEVHUB

sfdx force:package:version:create -p $PACKAGENAME -d force-app -k $KEY --wait 10 -v $DEVHUB

PACKAGES=`jq '.packageAliases' sfdx-project.json | jq 'keys'`
LASTPACKAGE=`echo $PACKAGES | jq length`
LASTPACKAGE=$(($LASTPACKAGE-1))
VERSION=`echo $PACKAGES | jq ".[$LASTPACKAGE]"`
VERSION=${VERSION//\"}

sfdx force:package:install --wait 10 --publishwait 10 --package $VERSION -k $KEY -r -u $TARGET

