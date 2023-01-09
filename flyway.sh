set -e
/usr/local/bin/jq -n "$FLYWAY_SA" > /tmp/credentials.json
echo "$FLYWAY_SA"
export KEYFILE=/tmp/credentials.json
export CLASSPATH=/FlywaySchemaBigquery/lib/GoogleBigQueryJDBC/GoogleBigQueryJDBC42/1.0/GoogleBigQueryJDBC42-1.0.jar
cp /FlywaySchemaBigquery/flyway.conf $HOME
chmod -R 777 /FlywaySchemaBigquery/flyway/db/migration/
ls -rtl /FlywaySchemaBigquery/flyway/db/migration/
java -jar /FlywaySchemaBigquery/target/FlywaySchemaBigquery-1.0-SNAPSHOT-jar-with-dependencies.jar
