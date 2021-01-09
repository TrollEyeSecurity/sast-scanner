#!/usr/bin/env bash

git clone --single-branch --branch $BRANCH https://$REPOUSER:$REPOTOKEN@$REPOURL
sonar-scanner -X -Dsonar.host.url=$SONARHOSTURL -Dsonar.projectKey=$PROJECTNAME-$BRANCH -Dsonar.login=$SONARLOGIN -Dsonar.projectBaseDir=/opt/$PROJECTNAME/ -Dsonar.ce.javaOpts=-Xmx2048m
