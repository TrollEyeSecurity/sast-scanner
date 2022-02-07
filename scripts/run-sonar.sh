#!/usr/bin/env bash

case "$TECH" in
  dotnet)
    SCANNER=/opt/sonar-scanner-msbuild-5.5.0.42949-net5.0/sonar-scanner-4.6.2.2472/bin/sonar-scanner
    ;;
  *)
    SCANNER=/opt/sonar-scanner-4.6.2.2472-linux/bin/sonar-scanner
    ;;
esac

git clone --single-branch --branch "$BRANCH" "$REPOURL"
"$SCANNER" -X -Dsonar.host.url="$SONARHOSTURL" -Dsonar.projectKey="$PROJECTNAME"-"$BRANCH" -Dsonar.login="$SONARLOGIN" -Dsonar.projectBaseDir=/opt/"$PROJECTNAME"/ -Dsonar.ce.javaOpts=-Xmx2048m