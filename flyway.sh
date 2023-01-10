#!/bin/sh
set -e
/usr/local/bin/jq -n "$FLYWAY_SA" > /tmp/credentials.json
##echo "$FLYWAY_SA"
export KEYFILE=/tmp/credentials.json
cat /tmp/credentials.json
export GOOGLE_APPLICATION_CREDENTIALS=/tmp/credentials.json
#jar tvf /flyway.jar | grep migration
#java -jar /flyway.jar

/usr/bin/mvn clean
/usr/bin/mvn clean compile assembly:single
ls -rtl /home/lib/GoogleBigQueryJDBC/GoogleBigQueryJDBC42/1.0/
cd /home/target/classes/com/flywaybigquery/
java -Dfile.encoding=UTF-8 -classpath /home/flyway/FlywaySchemaBigquery/target/classes:/home/.m2/repository/org/flywaydb/flyway-gcp-bigquery/9.11.0/flyway-gcp-bigquery-9.11.0.jar:/home/.m2/repository/org/flywaydb/flyway-core/9.11.0/flyway-core-9.11.0.jar:/home/.m2/repository/com/fasterxml/jackson/dataformat/jackson-dataformat-toml/2.14.0/jackson-dataformat-toml-2.14.0.jar:/home/.m2/repository/com/google/auth/google-auth-library-credentials/1.14.0/google-auth-library-credentials-1.14.0.jar:/home/.m2/repository/GoogleBigQueryJDBC/GoogleBigQueryJDBC42/1.0/GoogleBigQueryJDBC42-1.0.jar:/home/.m2/repository/com/google/auth/google-auth-library-oauth2-http/1.14.0/google-auth-library-oauth2-http-1.14.0.jar:/home/.m2/repository/com/google/auto/value/auto-value-annotations/1.10.1/auto-value-annotations-1.10.1.jar:/home/.m2/repository/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar:/home/.m2/repository/com/google/http-client/google-http-client/1.42.3/google-http-client-1.42.3.jar:/home/.m2/repository/com/google/http-client/google-http-client-gson/1.42.3/google-http-client-gson-1.42.3.jar:/home/.m2/repository/com/google/guava/guava/31.0.1-android/guava-31.0.1-android.jar:/home/.m2/repository/com/google/api-client/google-api-client/2.1.1/google-api-client-2.1.1.jar:/home/.m2/repository/commons-codec/commons-codec/1.15/commons-codec-1.15.jar:/home/.m2/repository/com/google/oauth-client/google-oauth-client/1.34.1/google-oauth-client-1.34.1.jar:/home/.m2/repository/com/google/http-client/google-http-client-apache-v2/1.42.3/google-http-client-apache-v2-1.42.3.jar:/home/.m2/repository/org/apache/httpcomponents/httpcore/4.4.15/httpcore-4.4.15.jar:/home/.m2/repository/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar:/home/.m2/repository/com/google/cloud/google-cloud-bigquery/2.19.1/google-cloud-bigquery-2.19.1.jar:/home/.m2/repository/com/google/cloud/google-cloud-core/2.8.27/google-cloud-core-2.8.27.jar:/home/.m2/repository/com/google/protobuf/protobuf-java-util/3.21.9/protobuf-java-util-3.21.9.jar:/home/.m2/repository/com/google/api/grpc/proto-google-common-protos/2.10.0/proto-google-common-protos-2.10.0.jar:/home/.m2/repository/com/google/api/grpc/proto-google-iam-v1/1.6.7/proto-google-iam-v1-1.6.7.jar:/home/.m2/repository/com/google/cloud/google-cloud-core-http/2.8.27/google-cloud-core-http-2.8.27.jar:/home/.m2/repository/com/google/http-client/google-http-client-appengine/1.42.3/google-http-client-appengine-1.42.3.jar:/home/.m2/repository/com/google/api/gax-httpjson/0.104.5/gax-httpjson-0.104.5.jar:/home/.m2/repository/io/opencensus/opencensus-api/0.31.1/opencensus-api-0.31.1.jar:/home/.m2/repository/io/opencensus/opencensus-contrib-http-util/0.31.1/opencensus-contrib-http-util-0.31.1.jar:/home/.m2/repository/com/google/http-client/google-http-client-jackson2/1.42.3/google-http-client-jackson2-1.42.3.jar:/home/.m2/repository/com/fasterxml/jackson/core/jackson-core/2.14.0/jackson-core-2.14.0.jar:/home/.m2/repository/javax/annotation/javax.annotation-api/1.3.2/javax.annotation-api-1.3.2.jar:/home/.m2/repository/commons-logging/commons-logging/1.2/commons-logging-1.2.jar:/home/.m2/repository/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3.jar:/home/.m2/repository/org/checkerframework/checker-compat-qual/2.5.5/checker-compat-qual-2.5.5.jar:/home/.m2/repository/org/checkerframework/checker-qual/3.27.0/checker-qual-3.27.0.jar:/home/.m2/repository/com/google/apis/google-api-services-bigquery/v2-rev20221028-2.0.0/google-api-services-bigquery-v2-rev20221028-2.0.0.jar:/home/.m2/repository/com/google/api/api-common/2.2.2/api-common-2.2.2.jar:/home/.m2/repository/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar:/home/.m2/repository/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar:/home/.m2/repository/com/google/api/gax/2.19.5/gax-2.19.5.jar:/home/.m2/repository/org/threeten/threetenbp/1.6.4/threetenbp-1.6.4.jar:/home/.m2/repository/com/google/code/gson/gson/2.10/gson-2.10.jar:/home/.m2/repository/org/threeten/threeten-extra/1.7.1/threeten-extra-1.7.1.jar:/home/.m2/repository/com/google/protobuf/protobuf-java/3.21.9/protobuf-java-3.21.9.jar:/home/.m2/repository/com/google/cloud/google-cloud-bigquerystorage/2.24.2/google-cloud-bigquerystorage-2.24.2.jar:/home/.m2/repository/io/grpc/grpc-api/1.50.2/grpc-api-1.50.2.jar:/home/.m2/repository/io/grpc/grpc-context/1.50.2/grpc-context-1.50.2.jar:/home/.m2/repository/io/grpc/grpc-stub/1.50.2/grpc-stub-1.50.2.jar:/home/.m2/repository/io/grpc/grpc-protobuf/1.50.2/grpc-protobuf-1.50.2.jar:/home/.m2/repository/io/grpc/grpc-protobuf-lite/1.50.2/grpc-protobuf-lite-1.50.2.jar:/home/.m2/repository/com/google/auto/value/auto-value/1.10/auto-value-1.10.jar:/home/.m2/repository/com/google/api/grpc/proto-google-cloud-bigquerystorage-v1beta1/0.148.2/proto-google-cloud-bigquerystorage-v1beta1-0.148.2.jar:/home/.m2/repository/com/google/api/grpc/proto-google-cloud-bigquerystorage-v1beta2/0.148.2/proto-google-cloud-bigquerystorage-v1beta2-0.148.2.jar:/home/.m2/repository/com/google/api/gax-grpc/2.19.5/gax-grpc-2.19.5.jar:/home/.m2/repository/io/grpc/grpc-alts/1.50.2/grpc-alts-1.50.2.jar:/home/.m2/repository/io/grpc/grpc-grpclb/1.50.2/grpc-grpclb-1.50.2.jar:/home/.m2/repository/org/conscrypt/conscrypt-openjdk-uber/2.5.2/conscrypt-openjdk-uber-2.5.2.jar:/home/.m2/repository/io/grpc/grpc-auth/1.50.2/grpc-auth-1.50.2.jar:/home/.m2/repository/io/grpc/grpc-netty-shaded/1.50.2/grpc-netty-shaded-1.50.2.jar:/home/.m2/repository/io/grpc/grpc-googleapis/1.50.2/grpc-googleapis-1.50.2.jar:/home/.m2/repository/org/json/json/20200518/json-20200518.jar:/home/.m2/repository/io/grpc/grpc-core/1.50.2/grpc-core-1.50.2.jar:/home/.m2/repository/com/google/android/annotations/4.1.1.4/annotations-4.1.1.4.jar:/home/.m2/repository/org/codehaus/mojo/animal-sniffer-annotations/1.22/animal-sniffer-annotations-1.22.jar:/home/.m2/repository/io/perfmark/perfmark-api/0.25.0/perfmark-api-0.25.0.jar:/home/.m2/repository/com/google/api/grpc/grpc-google-cloud-bigquerystorage-v1beta1/0.148.2/grpc-google-cloud-bigquerystorage-v1beta1-0.148.2.jar:/home/.m2/repository/com/google/api/grpc/grpc-google-cloud-bigquerystorage-v1beta2/0.148.2/grpc-google-cloud-bigquerystorage-v1beta2-0.148.2.jar:/home/.m2/repository/com/google/api/grpc/grpc-google-cloud-bigquerystorage-v1/2.24.2/grpc-google-cloud-bigquerystorage-v1-2.24.2.jar:/home/.m2/repository/com/google/api/grpc/proto-google-cloud-bigquerystorage-v1/2.24.2/proto-google-cloud-bigquerystorage-v1-2.24.2.jar:/home/.m2/repository/org/apache/arrow/arrow-vector/10.0.0/arrow-vector-10.0.0.jar:/home/.m2/repository/org/apache/arrow/arrow-format/10.0.0/arrow-format-10.0.0.jar:/home/.m2/repository/com/fasterxml/jackson/core/jackson-annotations/2.14.0/jackson-annotations-2.14.0.jar:/home/.m2/repository/com/fasterxml/jackson/core/jackson-databind/2.14.0/jackson-databind-2.14.0.jar:/home/.m2/repository/com/fasterxml/jackson/datatype/jackson-datatype-jsr310/2.14.0/jackson-datatype-jsr310-2.14.0.jar:/home/.m2/repository/io/netty/netty-common/4.1.82.Final/netty-common-4.1.82.Final.jar:/home/.m2/repository/com/google/flatbuffers/flatbuffers-java/1.12.0/flatbuffers-java-1.12.0.jar:/home/.m2/repository/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar:/home/.m2/repository/org/apache/arrow/arrow-memory-core/10.0.0/arrow-memory-core-10.0.0.jar:/home/.m2/repository/org/apache/arrow/arrow-memory-netty/10.0.0/arrow-memory-netty-10.0.0.jar:/home/.m2/repository/io/netty/netty-buffer/4.1.82.Final/netty-buffer-4.1.82.Final.jar:/home/.m2/repository/com/google/errorprone/error_prone_annotations/2.16/error_prone_annotations-2.16.jar:/home/.m2/repository/org/apache/maven/plugins/maven-deploy-plugin/2.7/maven-deploy-plugin-2.7.jar:/home/.m2/repository/org/apache/maven/maven-plugin-api/2.0.6/maven-plugin-api-2.0.6.jar:/home/.m2/repository/org/apache/maven/maven-project/2.0.6/maven-project-2.0.6.jar:/home/.m2/repository/org/apache/maven/maven-settings/2.0.6/maven-settings-2.0.6.jar:/home/.m2/repository/org/apache/maven/maven-profile/2.0.6/maven-profile-2.0.6.jar:/home/.m2/repository/org/apache/maven/maven-artifact-manager/2.0.6/maven-artifact-manager-2.0.6.jar:/home/.m2/repository/org/apache/maven/maven-repository-metadata/2.0.6/maven-repository-metadata-2.0.6.jar:/home/.m2/repository/org/apache/maven/wagon/wagon-provider-api/1.0-beta-2/wagon-provider-api-1.0-beta-2.jar:/home/.m2/repository/org/apache/maven/maven-plugin-registry/2.0.6/maven-plugin-registry-2.0.6.jar:/home/.m2/repository/org/codehaus/plexus/plexus-container-default/1.0-alpha-9-stable-1/plexus-container-default-1.0-alpha-9-stable-1.jar:/home/.m2/repository/junit/junit/3.8.1/junit-3.8.1.jar:/home/.m2/repository/classworlds/classworlds/1.1-alpha-2/classworlds-1.1-alpha-2.jar:/home/.m2/repository/org/apache/maven/maven-model/2.0.6/maven-model-2.0.6.jar:/home/.m2/repository/org/apache/maven/maven-artifact/2.0.6/maven-artifact-2.0.6.jar:/home/.m2/repository/org/codehaus/plexus/plexus-utils/1.5.6/plexus-utils-1.5.6.jar com.flywaybigquery.App /home/flyway/FlywaySchemaBigquery/flyway/db/migration/