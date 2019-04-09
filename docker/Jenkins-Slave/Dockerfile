FROM jenkins/slave:latest
MAINTAINER Aleksey Ovchinnikov <alexovchinnicov@gmail.com>
LABEL Description="Based on Jenkins agents image + added oleg-nenashev bash script + maven tools + Yandex allure" Vendor="Jenkins project" 


# Apache Maven variable
ARG MAVEN_VERSION=3.6.0
ARG USER_HOME_DIR="/home/jenkins"
ARG SHA=fae9c12b570c3ba18116a4e26ea524b29f7279c17cbaadc3326ca72927368924d9131d11b9e851b8dc9162228b6fdea955446be41207a5cfc61283dd8a561d2f
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

# Yandex Allure variable
ARG RELEASE=2.10.0
ARG ALLURE_DIR="/opt/allure"
ARG ALLURE_REPO=https://dl.bintray.com/qameta/maven/io/qameta/allure/allure-commandline

USER root

# Apache Maven steps
RUN mkdir -p /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Yandex Allure steps
COPY files/allure-harviewer.tar.gz   /tmp
COPY files/custom-logo-plugin.tar.gz /tmp
RUN mkdir -p ${ALLURE_DIR} \
  && curl -fsSL -o /tmp/allure-${RELEASE}.zip ${ALLURE_REPO}/${RELEASE}/allure-commandline-${RELEASE}.zip \
  && unzip  /tmp/allure-${RELEASE}.zip -d /tmp \
  && cd /tmp/allure-${RELEASE} \
  && cp -r . ${ALLURE_DIR} \
  && mkdir -p ${ALLURE_DIR}/plugins/allure-harviewer \
  && tar -xzf /tmp/allure-harviewer.tar.gz -C ${ALLURE_DIR}/plugins/allure-harviewer --strip-components=1 \
  && tar -xzf /tmp/custom-logo-plugin.tar.gz -C ${ALLURE_DIR}/plugins/custom-logo-plugin --strip-components=1 \
  && rm -rf /tmp/* \
  && ln -s ${ALLURE_DIR}/bin/allure /usr/bin/allure
COPY files/allure.yml ${ALLURE_DIR}/config/allure.yml
RUN mkdir -p /var/log/jenkins \
  && chown jenkins.jenkins /var/log/jenkins

USER jenkins

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV ALLURE_HOME ${ALLURE_DIR}

COPY jenkins-slave /usr/local/bin/jenkins-slave

ENTRYPOINT ["jenkins-slave"]
