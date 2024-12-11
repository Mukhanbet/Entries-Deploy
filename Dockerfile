FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /demo
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
WORKDIR /demo
COPY --from=build ./target/memories-app-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 2020
ENTRYPOINT ["java", "-jar", "/demo.jar"]