FROM eclipse-temurin:17-jdk-alpine
RUN apk update
RUN apk add git
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git  
RUN export CLASSPATH=/FlywaySchemaBigquery/lib/GoogleBigQueryJDBC/GoogleBigQueryJDBC42/1.0/GoogleBigQueryJDBC42-1.0.jar
RUN java -jar /FlywaySchemaBigquery/out/artifacts/FlywaySchemaBigquery_jar/FlywaySchemaBigquery.jar
RUN echo $(pwd)
RUN echo $(ls -rtl /FlywaySchemaBigquery/target/classes/)
RUN echo $(ls -rtl /FlywaySchemaBigquery/lib/)
RUN echo $(which java)
