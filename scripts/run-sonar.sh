#!/usr/bin/env bash

case "$TECH" in
  net50)
    SONAR-SCANNER=/opt/sonar-scanner-4.6.2.2472-net5.0/bin/sonar-scanner
    ;;
  net46)
    SONAR-SCANNER=/opt/sonar-scanner-4.6.2.2472-net46/bin/sonar-scanner
    ;;
  *)
    SONAR-SCANNER=/opt/sonar-scanner-4.6.2.2472/bin/sonar-scanner
    ;;
esac

git clone --single-branch --branch "$BRANCH" "$REPOURL"
"$SONAR-SCANNER" -X -Dsonar.host.url="$SONARHOSTURL" -Dsonar.projectKey="$PROJECTNAME"-"$BRANCH" -Dsonar.login="$SONARLOGIN" -Dsonar.projectBaseDir=/opt/"$PROJECTNAME"/ -Dsonar.ce.javaOpts=-Xmx2048m
