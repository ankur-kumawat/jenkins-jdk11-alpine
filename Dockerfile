From alpine:latest
CMD ["/bin/sh"]
USER root
RUN apk add openjdk11
RUN apk add curl
RUN wget https://get.jenkins.io/war-stable/2.289.1/jenkins.war
RUN apk add ttf-dejavu
CMD ["/bin/sh" "-c" "java -jar jenkins.war"]
