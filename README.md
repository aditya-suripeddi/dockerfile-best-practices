# Line Buddies: apt-get update & install in same RUN

Each RUN instruction can be seen as a cacheable unit of execution. Too many of them can be
unnecessary, while chaining all commands into one RUN instruction can bust the cache
easily, hurting the development cycle. When installing packages from package managers, you 
always want to update the index and install packages in the same RUN: they form together one 
cacheable unit. This prevents using an outdated package cache.


```diff
FROM debian
# Install required system packages
- RUN apt-get update
- RUN apt-get -y install openjdk-11-jdk ssh emacs
+ RUN apt-get update \
      && apt-get -y install \
      openjdk-11-jdk ssh emacs
# Copy required jar file 
COPY target/app.jar /app
# Run jar file
CMD ["java", "-jar", "/app/app.jar"]   
```


## Reference: 

[intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)
[dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)
[apt-get-section](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
