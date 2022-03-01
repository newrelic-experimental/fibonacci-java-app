FROM eclipse-temurin:11-jdk as base

COPY ./ ./
RUN ./gradlew bootJar

FROM eclipse-temurin:11

COPY --from=base /build/libs/fibonacci-java.jar /app.jar

ENTRYPOINT java -jar app.jar
