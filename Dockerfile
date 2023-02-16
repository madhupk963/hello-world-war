FROM maven:3.8.2-openjdk-8 as build_stage
ARG BUILD_VERSION=1.0.5
ENV BUILD_VERSION=${BUILD_VERSION}
WORKDIR /prajwal
COPY . .
RUN mvn clean package

FROM tomcat:9.0
ARG BUILD_VERSION=1.0.5
ENV BUILD_VERSION=${BUILD_VERSION}
COPY --from=build_stage /prajwal/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/


