# look for minimal flavors - parent image flavours with low memory footprint
FROM openjdk:8-jre-alpine
COPY target/app.jar /app/
CMD ["java", "-jar", "/app/app.jar" ]
