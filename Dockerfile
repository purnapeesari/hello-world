FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/webapp.war $PROJECT_HOME/webapp.war

WORKDIR $PROJECT_HOME

CMD ["java", "-Djava.security.egd=file:/dev/./urandom","-war","./webapp.war"]
