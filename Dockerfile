FROM openjdk:17
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
RUN mkdir /app
VOLUME /app
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git 
ENTRYPOINT ["java","-cp","lib/*","com.flywaybigquery.App"]
RUN ls -rtl /app/* 
