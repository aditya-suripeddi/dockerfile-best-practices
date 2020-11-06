# Remove package manager cache
FROM debian
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*
COPY target/app.jar /app/
CMD ["java", "-jar", "/app/app.jar" ]
