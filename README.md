# Build from source in consistent environment |  Reproducibility

Make the Dockerfile your blueprint:

     1. It describes the build environment
     
     2. Correct versions of build tools installed
     
     3. Prevent inconsistencies between environments
     
     4. There may be system dependencies
     
     5. The "source of truth" is the source code, not the build artifact
     

You should start by identifying all that’s needed to build your application. Our simple Java application
requires Maven and the JDK, so let’s base our Dockerfile off of a specific minimal official maven image
from Docker Hub, that includes the JDK. If you needed to install more dependencies, you could do so in a RUN step.

The pom.xml and src folders are copied in as they are needed for the final RUN step that produces the
app.jar application with mvn package. (The -e flag is to show errors and -B to run in non-interactive aka “batch” mode).

We solved the inconsistent environment problem, but introduced another one: every time the code is changed, all the
dependencies described in pom.xml are fetched. Hence the next tip.


```diff
-FROM openjdk:8-jre-alpine
+FROM maven:3.6.1-jdk-8-alpine
+WORKDIR /app
-# Copy required jar file
-COPY target/app.jar /app
COPY pom.xml .
COPY src ./src
RUN mvn -e -B package
# Run jar file
CMD ["java", "-jar", "/app/target/app.jar"]   
```

## Commands to run 

```
    Install docker and run the docker daemon
 
    $ sudo dockerd &    
 
 
    Clone the repository 
 
    $ git clone https://github.com/aditya-suripeddi/dockerfile-best-practices.git
 
 
    Go to the project directory 
 
    $ cd dockerfile-best-practices
 
    Checkout to branch 
  
    $git checkout 9-build-from-source-in-consistent-environment
  
 
    Build the container image
 
    $ docker build -t 9-build-from-source-in-consistent-environment . 
 
 
    Run the container
 
    $ docker run 9-build-from-source-in-consistent-environment
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

[11-multi-stage-builds-to-remove-build-deps](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/11-multi-stage-builds-to-remove-build-deps)


## References:

  1.  [intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)

  2.  [reference-slides-of-the-blog-above](https://drive.google.com/file/d/16t_-DRTohzyVPJy6Cx8a3PxLQ-95CfYK/view)

  3.  [github-dockerfile-best-practices-nodejs](https://github.com/juan131/dockerfile-best-practices)
  
  4.  [dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)

  5.  [dockerdocs-dockerfile-best-practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
