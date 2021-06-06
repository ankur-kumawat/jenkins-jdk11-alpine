FROM alpine:latest
CMD ["/bin/sh"]
USER root
RUN apk add openjdk11
RUN apk add curl
RUN wget https://get.jenkins.io/war-stable/2.289.1/jenkins.war
RUN apk add ttf-dejavu

# Setup jenkins args and env vars

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=50000

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT ${agent_port}

# Jenkins is run with user jenkins and uid 1000. If you bind mount a volume from the host or a data container, use the same uid

RUN addgroup -g ${gid} ${group}
RUN adduser -h "$JENKINS_HOME" -S ${uid} -g ${gid} -s /bin/bash ${user}

# Set up internal volume for jenkins
VOLUME /var/jenkins_home

# Run/Start jenkins
CMD ["/bin/sh" "-c" "java -jar jenkins.war"]
