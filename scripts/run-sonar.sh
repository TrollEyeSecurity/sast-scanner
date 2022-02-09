#!/usr/bin/env bash

git clone --single-branch --branch "$BRANCH" "$REPOURL"
SCANNER=/opt/sonar-scanner-4.6.2.2472-linux/bin/sonar-scanner

case "$TECH" in
  dotnet)
    export PATH="$PATH:/root/.dotnet/tools"
    dotnet sonarscanner begin /k:"$PROJECTNAME"-"$BRANCH"-dotnet /d:sonar.login="$SONARLOGIN" /d:sonar.host.url="$SONARHOSTURL"
    find . -name "*.sln" | while read x; do dotnet build "$x"; done
    dotnet sonarscanner end /d:sonar.login="$SONARLOGIN"
    ;;
esac

"$SCANNER" -X -Dsonar.host.url="$SONARHOSTURL" -Dsonar.projectKey="$PROJECTNAME"-"$BRANCH" -Dsonar.login="$SONARLOGIN" -Dsonar.projectBaseDir=/opt/"$PROJECTNAME"/ -Dsonar.ce.javaOpts=-Xmx2048m
