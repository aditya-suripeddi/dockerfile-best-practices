# Use official images where possible
FROM openjdk
COPY target/app.jar /app/
CMD ["java", "-jar", "/app/app.jar" ]
