FROM openjdk:17
VOLUME /tmp
ARG DEPENDENCY=./target/classes
ARG DEPENDENCYJARS=lib
COPY ${DEPENDENCYJARS} /tmp/lib
COPY ${DEPENDENCY}/META-INF /tmp/MANIFEST.MF
COPY ./out/artifcats/FlywaySchemaBigquery_jar/FlywaySchemaBigquery.jar /tmp
COPY ./target/classes/db/migration/* /tmp/db/migration/*
WORKDIR /tmp
ENTRYPOINT ["java","-cp","tmp:tmp/lib/*","com.flywaybigquery.App"]
