#!/bin/sh
set -e
/usr/local/bin/jq -n "$FLYWAY_SA" > /tmp/credentials.json
##echo "$FLYWAY_SA"
export KEYFILE=/tmp/credentials.json
cat /tmp/credentials.json
export GOOGLE_APPLICATION_CREDENTIALS=/tmp/credentials.json
jar tvf /flyway.jar | grep migration
java -jar /flyway.jar