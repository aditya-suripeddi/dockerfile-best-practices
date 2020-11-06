# Use more specific tags

Some of those tags have minimal flavors which means they are even smaller images. The slim variant is based 
on a stripped down Debian, while the alpine variant is based on the even smaller Alpine Linux distribution 
image. A notable difference is that debian still uses GNU libc while alpine uses musl libc which, although 
much smaller, may in some cases cause compatibility issues. In the case of openjdk, the jre flavor only contains
the java runtime, not the sdk; this also drastically reduces the image size.



```diff
-FROM openjdk:8
+FROM openjdk:8-jre-alpine
# Copy required jar file 
COPY target/app.jar /app
# Run jar file
CMD ["java", "-jar", "/app/app.jar"]   
```

## Commands to run 

  To see the difference in image size between different flavors: 
```
  $ docker pull openjdk:8
    ...
    ...
  $ docker pull openjdk:8-jre
    ...
    ...
  $ docker pull openjdk:8-jre-slim
    ...
    ...
  $ docker pull openjdk:8-jre-alpine
    ...
    ..,
  $ docker images openjdk
    # output observed:
    # note the SIZE for each flavor

       REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

       openjdk             8-jre-slim          21a3c44ee1bb        10 days ago         187MB
       openjdk             8-jre               3baa5c4641ad        10 days ago         268MB
       openjdk             8                   3edb5f36304e        10 days ago         514MB
       openjdk             8-jre-alpine        f7a292bbb70c        18 months ago       84.9MB
 
   # just using a different base image reduced the image size by  540 MB
```  
  
 To run the project in a docker container: 
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

