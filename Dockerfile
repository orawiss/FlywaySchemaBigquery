FROM openjdk:17
FROM ubuntu:20.04
RUN sudo add-apt-repository ppa:git-core/ppa
RUN sudo apt install -y git
RUN mkdir /app
VOLUME /app
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git 
ENTRYPOINT ["java","-cp","lib/*","com.flywaybigquery.App"]
RUN ls -rtl /app/* 
