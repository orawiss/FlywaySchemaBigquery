FROM eclipse-temurin:17-jdk-alpine
RUN apk update
RUN apk add git
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq && \
    chmod +x /usr/local/bin/jq
RUN apk add maven
# install java based on https://github.com/docker-library/openjdk/blob/4e39684901490c13eaef7892c44e39043d7c4bed/8-jdk/alpine/Dockerfile
RUN { \
                echo '#!/bin/sh'; \
                echo 'set -e'; \
                echo; \
                echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
        } > /usr/local/bin/docker-java-home \
        && chmod +x /usr/local/bin/docker-java-home
RUN echo $(which java)
RUN ls -rtl  /usr/lib/jvm/
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-17-openjdk/jre/bin:/usr/lib/jvm/java-17-openjdk/bin


RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
    mv jq-linux64 /usr/local/bin/jq && \
    chmod +x /usr/local/bin/jq
RUN echo $(which java)
RUN ["chmod", "+x", "./flyway.sh"]
ENTRYPOINT ["./flyway.sh"]