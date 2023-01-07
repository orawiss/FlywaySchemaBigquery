FROM openjdk:17
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
RUN mkdir /app
VOLUME /app
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git 
ENTRYPOINT ["java","-cp","lib/*","com.flywaybigquery.App"]
RUN ls -rtl /app/* 
