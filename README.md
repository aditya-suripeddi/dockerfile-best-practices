# Order matters for caching 

In a development cycle, when building a Docker image, making code changes, then rebuilding, it 
is important to leverage caching. Caching helps to avoid running build steps again when they don’t need to.


However, the order of the build steps (Dockerfile instructions) matters, because when a step’s cache
is invalidated by changing files or modifying lines in the Dockerfile, subsequent steps of their 
cache will break. Order your steps from least to most frequently changing steps to optimize caching.


```diff
FROM debian
- # Copy application files
- COPY . /app
# Install required system packages
RUN apt-get update
RUN apt-get -y install openjdk-11-jdk ssh emacs
+ # Copy application files
+ COPY . /app
# Run jar file
CMD ["java", "-jar", "/app/target/app.jar"]   
```

Now even if there are some changes made in application files / project files 
docker build will take less time as RUN instructions are cached and reused
while building



Reference: 

[intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)
