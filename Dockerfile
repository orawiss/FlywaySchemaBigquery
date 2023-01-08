FROM eclipse-temurin:17-jdk-alpine
RUN apk update
RUN apk add git
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git  
RUN export CLASSPATH=/FlywaySchemaBigquery/lib/GoogleBigQueryJDBC/GoogleBigQueryJDBC42/1.0/GoogleBigQueryJDBC42-1.0.jar
RUN java -jar /FlywaySchemaBigquery/target/FlywaySchemaBigquery-1.0-SNAPSHOT-jar-with-dependencies.jar
RUN echo $(pwd)
RUN echo $(which java)
