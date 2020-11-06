# Multi Stage Builds to Remove Build Dependencies (like maven, pip) in docker image | Reduce Image Size

Multi-stage builds are recognizable by the multiple FROM statements. Each FROM starts a new stage. They can be
named with the AS keyword which we use to name our first stage “builder” to be referenced later. It will include
all our build dependencies in a consistent environment.

```diff
- FROM maven:3.6.1-jdk-8-alpine
+ FROM maven:3.6.1-jdk-8-alpine AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B  dependency:resolve
COPY src ./src
RUN mvn -e -B package

+FROM openjdk:8-jre-alpine
+COPY --from=builder /app/target/app.jar /
# Run jar file
- CMD ["java", "-jar", "/app/target/app.jar"]   
+ CMD ["java", "-jar", "/app.jar"]   
```

The second stage is our final stage which will result in the final image. It will include the strict necessary
for the runtime, in this case a minimal JRE (Java Runtime) based on Alpine. The intermediary builder stage will
be cached but not present in the final image. In order to get build artifacts into our final image, use
COPY --from=STAGE_NAME. In this case, STAGE_NAME is builder. 

Multi-stage builds is the go-to solution to remove build-time dependencies.


**We went from building bloated images inconsistently to building minimal images in a consistent environment while being cache-friendly.**


## Commands to Run: 

```
    Install docker and run the docker daemon
 
    $ sudo dockerd &    
 
 
    Clone the repository 
 
    $ git clone https://github.com/aditya-suripeddi/dockerfile-best-practices.git
 
 
    Go to the project directory 
 
    $ cd dockerfile-best-practices
 
    Checkout to branch 
  
    $git checkout 11-multi-stage-builds-to-remove-build-deps
  
 
    Build the container image
 
    $ docker build -t 11-multi-stage-builds-to-remove-build-deps . 
 
 
    Run the container
 
    $ docker run 11-multi-stage-builds-to-remove-build-deps
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

Improving Incremental build time?

[10-fetch-dependencies-in-a-separate-step](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/10-fetch-dependencies-in-a-separate-step)

Reduce Image Size? [multi-stage-builds-reduce-image-size](https://blog.logrocket.com/reduce-docker-image-sizes-using-multi-stage-builds/#:~:text=Multi%2Dstage%20builds%20in%20Docker,easy%20to%20read%20and%20understand.)

[11-multi-stage-builds-to-remove-build-deps](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/11-multi-stage-builds-to-remove-build-deps.git)


## References:

  1.  [intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)

  2.  [reference-slides-of-the-blog-above](https://drive.google.com/file/d/16t_-DRTohzyVPJy6Cx8a3PxLQ-95CfYK/view)

  3.  [github-dockerfile-best-practices-nodejs](https://github.com/juan131/dockerfile-best-practices)
  
  4.  [dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)

  5.  [dockerdocs-dockerfile-best-practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
