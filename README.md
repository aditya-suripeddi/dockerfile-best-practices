# Use more specific tags | Maintainability

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
    Install docker and run the docker daemon
 
    $ sudo dockerd &    
 
 
    Clone the repository 
 
    $ git clone https://github.com/aditya-suripeddi/dockerfile-best-practices.git
 
 
    Go to the project directory 
 
    $ cd dockerfile-best-practices
 
    Checkout to branch 
  
    $git checkout 4-remove-unnecessary-dependencies
  
 
    Build the container image
 
    $ docker build -t 4-remove-unnecessary-dependencies . 
 
 
    Run the container
 
    $ docker run 4-remove-unnecessary-dependencies
 ```


## Links to best practices

Improving Incremental build time

[1-order-matters-for-caching](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/1-order-matters-for-caching) 

[2-more-specific-copy-to-limit-cache-busts](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/2-more-specific-copy-to-limit-cache-busts)

Reproducibility?

[3-line-buddies-apt-update-install](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/3-line-buddies-apt-update-install)

Reduce Image Size

[4-remove-unnecessary-dependencies](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/4-remove-unnecessary-dependencies)

[5-remove-package-manager-cache](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/5-remove-package-manager-cache)

Maintainability 

[6-use-official-images](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/6-use-official-images)

[7-use-more-specific-tags](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/7-user-more-specific-tags)

[8-look-for-minimal-flavors](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/8-look-for-mininal-flavors)

Reproducibility

[9-build-from-source-in-consistent-environemnt](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/9-build-from-source-in-consistent-environment)


## References:

  1.  [intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)

  2.  [reference-slides-of-the-blog-above](https://drive.google.com/file/d/16t_-DRTohzyVPJy6Cx8a3PxLQ-95CfYK/view)

  3.  [github-dockerfile-best-practices-nodejs](https://github.com/juan131/dockerfile-best-practices)
  
  4.  [dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)

