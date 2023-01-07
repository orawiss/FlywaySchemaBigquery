FROM openjdk:17
RUN mkdir /app
VOLUME /app
COPY git clone -n https://github.com/orawiss/FlywaySchemaBigquery.git 
ENTRYPOINT ["java","-cp","lib/*","com.flywaybigquery.App"]
RUN ls -rtl /app/* 
