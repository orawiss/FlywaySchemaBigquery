FROM openjdk:17
RUN yum install -y git
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git 
ENTRYPOINT ["java","-cp","./FlywaySchemaBigquery/target/classes/*","com.flywaybigquery.App"]
