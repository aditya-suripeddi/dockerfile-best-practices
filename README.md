# Use more specific tags

Do not use the latest tag. It has the convenience of always being available for official images 
on Docker Hub but there can be breaking changes over time. Depending on how far apart in time you
rebuild the Dockerfile without cache, you may have failing builds.

Instead, use more specific tags for your base images. In this case, we’re using openjdk. There are a lot
more tags available so check out the Docker Hub documentation for that image which lists all the existing variants.



```diff
-FROM openjdk:latest
+FROM openjdk:8
# Copy required jar file 
COPY target/app.jar /app
# Run jar file
CMD ["java", "-jar", "/app/app.jar"]   
```

## Commands to run 

```
   $ docker build -t use-more-specific-tags .
      ...
      ...
   $ docker run use-more-specific-tags
```


## Reference: 

[intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)
[dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)


## Next best practice 

