# Use more specific tags openjdk:latest -> openjdk:8
FROM openjdk:8
COPY target/app.jar /app/
CMD ["java", "-jar", "/app/app.jar" ]
