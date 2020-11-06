# Use official images where possible

    1. Reduce time spend on maintenance 
       (frequently updated with fixes)
    2. Reduce size (shared layers between images)
    3. Pre-configured for container use
    4. Built by smart people 
    
    
Official images can save a lot of time spent on maintenance because all the
installation steps are done and best practices are applied. If you have multiple
projects, they can share those layers because they use exactly the same base image.


```diff
-FROM debian
-# Install required system packages
-RUN apt-get update \
-     && apt-get -y install --no-install-recommends \
-    openjdk-11-jdk \
-    && rm -rf /var/lib/apt/lists/*
+FROM openjdk
# Copy required jar file 
COPY target/app.jar /app
# Run jar file
CMD ["java", "-jar", "/app/app.jar"]   
```


## Reference: 

[intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)
[dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)
