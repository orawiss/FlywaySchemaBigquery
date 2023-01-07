FROM eclipse-temurin:8u352-b08-jre-alpin
RUN apk update
RUN apk add git
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git 
ENTRYPOINT ["java","-cp","./FlywaySchemaBigquery/target/classes/*","com.flywaybigquery.App"]
