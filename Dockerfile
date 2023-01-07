FROM openjdk:17
COPY out out
COPY pom.xml .
COPY src src
COPY lib lib
ENTRYPOINT ["java","-cp","lib/*","com.flywaybigquery.App"]
RUN ls -rtl lib/* 
