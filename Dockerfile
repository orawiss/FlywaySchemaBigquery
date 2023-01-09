FROM eclipse-temurin:17-jdk-alpine
RUN apk update
RUN apk add git
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq && \
    chmod +x /usr/local/bin/jq
RUN git clone https://github.com/orawiss/FlywaySchemaBigquery.git  
RUN echo $(which java)
RUN ["chmod", "+x", "/FlywaySchemaBigquery/flyway.sh"]