FROM openjdk:11-jdk
FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=target/classes
ARG DEPENDENCYJARS=lib
COPY ${DEPENDENCYJARS} /tmp/lib
COPY ${DEPENDENCY}/META-INF /tmp/MANIFEST.MF
ENTRYPOINT ["java","-cp","tmp:tmp/lib/*","com.flywaybigquery.App"]
