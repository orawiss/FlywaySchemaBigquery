FROM eclipse-temurin:11-jre-focal as flyway
RUN apt-get update \
    && apt-get install -y python3-pip \
    && pip3 install sqlfluff==1.2.1

WORKDIR /flyway

RUN curl -L https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/9.9.0/flyway-commandline-9.9.0.tar.gz  -o flyway-commandline-9.9.0.tar.gz \
  && gzip -d flyway-commandline-9.9.0.tar.gz \
  && tar -xf flyway-commandline-9.9.0.tar --strip-components=1 \
  && rm flyway-commandline-9.9.0.tar \
  && chmod -R a+r /flyway \
  && chmod a+x /flyway/flyway


ENV PATH="/flyway:${PATH}"


RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq && \
    chmod +x /usr/local/bin/jq
COPY ./target/FlywaySchemaBigquery-1.0-SNAPSHOT-jar-with-dependencies.jar /flyway/flyway.jar
COPY ./src/main/resources/db/migration /flyway/db/migration
COPY ./flyway.conf /flyway/db/migration/flyway.conf
RUN echo $(which java)
RUN ["chmod", "+x", "/flyway/flyway.sh"]