#!/usr/bin/env bash
REPORT=dependency-check-report.json
git clone --single-branch --branch $BRANCH $REPOURL &>/dev/null
dependency-check.sh --project $PROJECTNAME --format JSON --scan /opt/$PROJECTNAME/ &>/dev/null
if [ -f $REPORT ]; then
  cat $REPORT
fi
