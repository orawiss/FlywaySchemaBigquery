FROM openjdk:11-jdk
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} FlywaySchemaBigquery-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/FlywaySchemaBigquery-1.0-SNAPSHOT.jar"]
