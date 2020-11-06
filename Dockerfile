# Remove unnecessary dependencies
FROM debian
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    openjdk-11-jdk
COPY target/app.jar /app/
CMD ["java", "-jar", "/app/app.jar" ]
