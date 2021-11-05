FROM alpine
LABEL maintainer="avery.rozar@trolleyesecurity.com"
WORKDIR /opt/
COPY sonar-scanner-4.6.2.2472-linux sonar-scanner-4.6.2.2472-linux/
COPY sonar-scanner-4.6.2.2472-net46 sonar-scanner-4.6.2.2472-net46/
COPY sonar-scanner-4.6.2.2472-net5.0 sonar-scanner-4.6.2.2472-net5.0/
COPY dependency-check dependency-check/
COPY scripts scripts/
RUN apk update && apk upgrade && apk add openjdk11 git && chmod +x /opt/dependency-check/bin/dependency-check.sh && chmod +x /opt/scripts/run-sonar.sh && chmod +x /opt/scripts/run-dep-checker.sh
ENV PATH="/opt/scripts:/opt/dependency-check/bin:${PATH}"
ENV JAVA_HOME=/usr
