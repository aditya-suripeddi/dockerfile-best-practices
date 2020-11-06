# Remove Package Manager Cache

Package managers maintain their own cache which may end up in the image. One way to deal with it is
to remove the cache in the same RUN instruction that installed packages. Removing it in another RUN
instruction would not reduce the image size.

There are further ways to reduce image size such as multi-stage builds which will be covered at the
end of this blog post. The next set of best practices will look at how we can optimize for 
maintainability, security, and repeatability of the Dockerfile.


```diff
FROM debian
# Install required system packages
RUN apt-get update \
     && apt-get -y install --no-install-recommends \
-     openjdk-11-jdk
+    openjdk-11-jdk \
+    && rm -rf /var/lib/apt/lists/*
# Copy required jar file 
COPY target/app.jar /app
# Run jar file
CMD ["java", "-jar", "/app/app.jar"]   
```


## Reference: 

[intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)
[dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)
