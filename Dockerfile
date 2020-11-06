# Only COPY what's needed, if possible avoid `COPY .`
FROM debian 
RUN apt-get update
RUN apt-get -y install openjdk-11-jdk ssh emacs
COPY target/app.jar /app/
CMD ["java", "-jar", "/app/app.jar" ]
