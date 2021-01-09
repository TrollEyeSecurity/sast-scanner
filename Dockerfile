FROM centos:7
LABEL maintainer="avery.rozar@trolleyesecurity.com"
WORKDIR /opt/
COPY sonar-scanner-4.5.0.2216-linux sonar-scanner-4.5.0.2216-linux/
COPY dependency-check dependency-check/
COPY scripts scripts/
RUN yum update -y && yum install java-11-openjdk.x86_64 git -y && chmod +x /opt/dependency-check/bin/dependency-check.sh && chmod +x /opt/scripts/run-sonar.sh && chmod +x /opt/scripts/run-dep-checker.sh
ENV PATH="/opt/sonar-scanner-4.5.0.2216-linux/bin:${PATH}"
ENV PATH="/opt/dependency-check/bin:${PATH}"
ENV PATH="/opt/scripts:${PATH}"
ENV JAVA_HOME=/usr
