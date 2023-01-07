FROM openjdk:17
COPY git clone 
ENTRYPOINT ["java","-cp","lib/*","com.flywaybigquery.App"]
RUN ls -rtl lib/* 
