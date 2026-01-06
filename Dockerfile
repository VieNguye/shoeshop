# Build Stage
FROM maven:3.9.6-amazoncorretto-11 AS build

WORKDIR /app

COPY . .

RUN mvn install -DskipTests=true

# Run Stage
FROM eclipse-temurin:11-jre-alpine

WORKDIR /run

COPY --from=build /app/target/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar /run/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/run/shoe-ShoppingCart-0.0.1-SNAPSHOT.jar" ]

