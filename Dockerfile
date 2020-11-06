# Order from least to most frequently changing content
FROM debian 
RUN apt-get update
RUN apt-get -y install openjdk-11-jdk ssh emacs
COPY . /app
CMD ["java", "-jar", "/app/target/app.jar" ]
