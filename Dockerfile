FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:17-jdk
WORKDIR /app
COPY --from=build /app/target/maven-app-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
