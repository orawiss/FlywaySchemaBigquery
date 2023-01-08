set -e
/usr/local/bin/jq -n "$DBT_SA" > /tmp/credentials.json
export KEYFILE=/tmp/credentials.json
export CLASSPATH=/FlywaySchemaBigquery/lib/GoogleBigQueryJDBC/GoogleBigQueryJDBC42/1.0/GoogleBigQueryJDBC42-1.0.jar
java -jar /FlywaySchemaBigquery/target/FlywaySchemaBigquery-1.0-SNAPSHOT-jar-with-dependencies.jar
