FROM eclipse-temurin:17-jdk-alpine
RUN apk update
RUN apk add git
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git  
RUN export CLASSPATH=/FlywaySchemaBigquery/lib/GoogleBigQueryJDBC/GoogleBigQueryJDBC42/1.0/GoogleBigQueryJDBC42-1.0.jar
RUN echo $(which java)
RUN /FlywaySchemaBigquery/flyway.sh
