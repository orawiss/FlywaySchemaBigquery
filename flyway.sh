set -e
/usr/local/bin/jq -n "$DBT_SA" > /tmp/credentials.json
echo "$DBT_SA"
export KEYFILE=/tmp/credentials.json
export CLASSPATH=/FlywaySchemaBigquery/lib/GoogleBigQueryJDBC/GoogleBigQueryJDBC42/1.0/GoogleBigQueryJDBC42-1.0.jar
mkdir -p /FlywaySchemaBigquery/target/db/migration/
java -jar /FlywaySchemaBigquery/target/FlywaySchemaBigquery-1.0-SNAPSHOT-jar-with-dependencies.jar "filesystem:/FlywaySchemaBigquery/*"
