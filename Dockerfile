# Build from source in a consistent environment
FROM maven:3.6.1-jdk-8-alpine
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -e -B package
CMD ["java", "-jar", "/app/target/app.jar" ]
