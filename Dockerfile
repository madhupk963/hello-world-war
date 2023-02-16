FROM maven:3.8.2-openjdk-8 as build_stage
ARG BUILD_NUMBER=${BUILD_NUMBER}
ENV BUILD_NUMBER=${BUILD_NUMBER}
WORKDIR /prajwal
COPY . .
RUN mvn clean package

FROM tomcat:9.0
ARG BUILD_NUMBER=${BUILD_NUMBER}
ENV BUILD_NUMBER=${BUILD_NUMBER}
COPY --from=build_stage /prajwal/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/
