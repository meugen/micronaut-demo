FROM openjdk:11-slim as build
ADD build.gradle settings.gradle gradle.properties gradlew micronaut-cli.yml /app/
ADD src /app/src/
ADD gradle /app/gradle/
WORKDIR /app
RUN ls -l
RUN ./gradlew build
RUN ls -l build/distributions

FROM openjdk:11-jre-slim
COPY --from=build /app/build/distributions/micronaut-demo-0.1.tar /app/micronaut-demo-0.1.tar
WORKDIR /app
RUN tar -xopf micronaut-demo-0.1.tar
ENTRYPOINT [ "./micronaut-demo-0.1/bin/micronaut-demo" ]