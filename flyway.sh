#!/bin/sh
set -e
/usr/local/bin/jq -n "$FLYWAY_SA" > /tmp/credentials.json
echo "$FLYWAY_SA"
jar tvf /flyway.jar | grep migration
java -jar /flyway.jar