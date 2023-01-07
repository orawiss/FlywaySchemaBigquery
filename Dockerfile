FROM openjdk:17
FROM ubuntu:20.04
RUN apt install git
RUN mkdir /app
VOLUME /app
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git 
ENTRYPOINT ["java","-cp","lib/*","com.flywaybigquery.App"]
RUN ls -rtl /app/* 
