FROM debian 
COPY . /app
RUN apt-get update
RUN apt-get -y install openjdk-11-jdk ssh emacs
CMD ["java", "-jar", "/app/target/app.jar" ]
