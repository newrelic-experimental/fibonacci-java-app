FROM eclipse-temurin:11-jdk as base
WORKDIR /app
COPY ./ /app
RUN ./gradlew bootJar

FROM eclipse-temurin:11

COPY --from=base /app/build/libs/fibonacci-java.jar /app.jar

ENTRYPOINT java -jar app.jar
