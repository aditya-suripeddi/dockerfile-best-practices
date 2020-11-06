# Line buddies: apt-get update & install in same RUN
FROM debian
RUN apt-get update \
    && apt-get -y install \
    openjdk-11-jdk ssh emacs
COPY target/app.jar /app/
CMD ["java", "-jar", "/app/app.jar" ]
