WORKDIR /app
COPY pom.xml .
COPY ./src ./src

FROM setup AS build
WORKDIR /app
RUN xvfb-run --server-args="-screen 0 1024x768x24" mvn clean package

FROM build AS analysis
WORKDIR /app
ARG SONAR_HOST_URL
ARG SONAR_LOGIN
RUN xvfb-run --server-args="-screen 0 1024x768x24" mvn verify
RUN xvfb-run --server-args="-screen 0 1024x768x24" mvn sonar:sonar -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.login=${SONAR_LOGIN}



# for me - i trying new thing, adding copy --from=build and set workdir /app, now before it was : FROM build as FINAL
#FROM build AS final
FROM alpine:3.20.2
WORKDIR /app
COPY --from=build /app/target/*.jar ./target/
RUN apk update && apk add --no-cache curl
ARG ARTIFACTORY_URL
ARG ARTIFACTORY_TOKEN
RUN curl -u admin:${ARTIFACTORY_TOKEN} -T target/*.jar ${ARTIFACTORY_URL}/artifactory/calc_local_repo/calculator/Calculator-1.0-SNAPSHOT.jar
