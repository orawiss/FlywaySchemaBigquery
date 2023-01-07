FROM openjdk:17
FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y install git
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git 
ENTRYPOINT ["java","-cp","./FlywaySchemaBigquery/target/classes/*","com.flywaybigquery.App"]
