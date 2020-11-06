# More specific COPY to limit cache busts

Only copy what’s needed. If possible, avoid “COPY  .” When copying files into your image, make sure 
you are very specific about what you want to copy. Any changes to the files being copied will break
the cache. In the example above, only the pre-built jar application is needed inside the image, so 
only copy that. That way unrelated file changes will not affect the cache.

```diff
FROM debian
# Install required system packages
RUN apt-get update
RUN apt-get -y install openjdk-11-jdk ssh emacs
- # Copy application files
- COPY . /app
+ # Copy required jar file 
+ COPY target/app.jar /app
# Run jar file
- CMD ["java", "-jar", "/app/target/app.jar"]   
+ CMD ["java", "-jar", "/app/app.jar"]   
```


## Reference: 

[intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)
