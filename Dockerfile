FROM ubuntu:20.04
LABEL maintainer="avery.rozar@trolleyesecurity.com"
WORKDIR /opt/
COPY sonar-scanner-4.6.2.2472-linux sonar-scanner-4.6.2.2472-linux/
COPY sonar-scanner-msbuild-5.5.0.42949-net5.0 sonar-scanner-msbuild-5.5.0.42949-net5.0/
COPY dependency-check dependency-check/
COPY scripts scripts/
ENV TZ=Us/Eastern
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install wget -y && \
        wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
        dpkg -i packages-microsoft-prod.deb && \
        rm -rf packages-microsoft-prod.deb && \
        apt update && apt dist-upgrade -y &&\
        apt install openjdk-11-jre git apt-transport-https dotnet-sdk-6.0 nodejs -y &&\
        chmod +x /opt/dependency-check/bin/dependency-check.sh &&\
        chmod +x /opt/scripts/run-sonar.sh &&\
        chmod +x /opt/scripts/run-dep-checker.sh &&\
        chmod +x /opt/sonar-scanner-msbuild-5.5.0.42949-net5.0/sonar-scanner-4.6.2.2472/bin/sonar-scanner &&\
        chmod +x /opt/sonar-scanner-4.6.2.2472-linux/bin/sonar-scanner && \
        dotnet tool install --global dotnet-sonarscanner
ENV PATH="/opt/scripts:/opt/dependency-check/bin:${PATH}"
ENV JAVA_HOME=/usr
