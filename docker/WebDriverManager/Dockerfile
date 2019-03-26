# Version: 0.0.1
FROM openjdk:8-jre-alpine
#Amazon's LTS image
#FROM amazoncorretto:latest

MAINTAINER Aleksey Ovchinnikov <alexovchinnicov@google.com>

COPY ./webdrivermanager-3.3.0-fat.jar /webdrivermanager-3.3.0-fat.jar

WORKDIR /tmp

EXPOSE 4041

ENTRYPOINT ["java","-Dwdm.targetPath=/tmp","-jar","/webdrivermanager-3.3.0-fat.jar","server"]
CMD [""]