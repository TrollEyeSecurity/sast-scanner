#!/usr/bin/env bash
REPORT=dependency-check-report.json
git clone --single-branch --branch $BRANCH https://$REPOUSER:$REPOTOKEN@$REPOURL &>/dev/null
dependency-check.sh --project $PROJECTNAME --format JSON --scan /opt/$PROJECTNAME/ &>/dev/null
if [ -f $REPORT ]; then
  cat $REPORT
fi
