FROM ubuntu:20.04
LABEL maintainer="avery.rozar@trolleyesecurity.com"
WORKDIR /opt/
COPY sonar-scanner-4.6.2.2472-linux sonar-scanner-4.6.2.2472-linux/
COPY sonar-scanner-4.6.2.2472-net46 sonar-scanner-4.6.2.2472-net46/
COPY sonar-scanner-4.6.2.2472-net5.0 sonar-scanner-4.6.2.2472-net5.0/
COPY dependency-check dependency-check/
COPY scripts scripts/
RUN apt update --no-cache &&\
        apt install openjdk-11-jre git -y &&\
        chmod +x /opt/dependency-check/bin/dependency-check.sh &&\
        chmod +x /opt/scripts/run-sonar.sh &&\
        chmod +x /opt/scripts/run-dep-checker.sh &&\
        chmod +x /opt/sonar-scanner-4.6.2.2472-net5.0/bin/sonar-scanner &&\
        chmod +x /opt/sonar-scanner-4.6.2.2472-net46/bin/sonar-scanner &&\
        chmod +x /opt/sonar-scanner-4.6.2.2472-linux/bin/sonar-scanner
ENV PATH="/opt/scripts:/opt/dependency-check/bin:${PATH}"
ENV JAVA_HOME=/usr
