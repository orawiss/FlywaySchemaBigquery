set -e
/usr/local/bin/jq -n "$FLYWAY_SA" > /tmp/credentials.json
echo "$FLYWAY_SA"
jar tvf /flyway/flyway.jar
java -jar /flyway/flyway.jar
