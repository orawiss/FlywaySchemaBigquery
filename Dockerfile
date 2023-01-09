FROM eclipse-temurin:11-jre-focal as flyway
RUN apt-get update \
    && apt-get install -y python3-pip \
    && pip3 install sqlfluff==1.2.1 \

WORKDIR /flyway
ARG FLYWAY_VERSION
ARG FLYWAY_ARTIFACT_URL=https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/

RUN curl -L ${FLYWAY_ARTIFACT_URL}${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz -o flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && gzip -d flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && tar -xf flyway-commandline-${FLYWAY_VERSION}.tar --strip-components=1 \
  && rm flyway-commandline-${FLYWAY_VERSION}.tar \
  && chmod -R a+r /flyway \
  && chmod a+x /flyway/flyway \
ENV PATH="/flyway:${PATH}"

ENTRYPOINT ["flyway"]
CMD ["-?"]

FROM flyway as redgate

RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq && \
    chmod +x /usr/local/bin/jq
COPY ./target/FlywaySchemaBigquery-1.0-SNAPSHOT-jar-with-dependencies.jar /flyway/flyway.jar
COPY ./flyway.sh /flyway/flyway.sh
COPY ./src/main/resources/db/migration /flyway/db/migration
COPY ./flyway.conf /flyway/db/migration
RUN echo $(which java)
RUN ["chmod", "+x", "/flyway.sh"]
