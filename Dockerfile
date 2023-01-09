FROM eclipse-temurin:17-jdk-alpine
RUN apk update
RUN apk add git
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq && \
    chmod +x /usr/local/bin/jq
COPY ./target/FlywaySchemaBigquery-1.0-SNAPSHOT-jar-with-dependencies.jar /flyway.jar
COPY ./flyway.sh /flyway.sh
RUN echo $(which java)
RUN ["chmod", "+x", "/flyway.sh"]