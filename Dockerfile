FROM eclipse-temurin:17-jdk-alpine
RUN apk update
RUN apk add git
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git  
WORKDIR '/FlywaySchemaBigquery/target/classes/com/flywaybigquery'
ENTRYPOINT ["java","-cp","/FlywaySchemaBigquery/target/classes/*:/FlywaySchemaBigquery/lib/*","com.flywaybigquery.App"]
RUN echo $(pwd)
