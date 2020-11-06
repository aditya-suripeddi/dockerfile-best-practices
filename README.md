# Fetch dependencies in a separate step | Improving Incremental build time

By again *thinking in terms of cacheable units of execution and identifying cacheable units of execution*, we can
decide that fetching dependencies is a separate cacheable unit that only needs to depend on changes to pom.xml and
not the source code. The RUN step between the two COPY steps tells Maven to only fetch the dependencies.

There is one more problem that got introduced by building in consistent environments: our image is way
bigger than before because it includes all the build-time dependencies that are not needed at runtime.


```diff
FROM maven:3.6.1-jdk-8-alpine
WORKDIR /app
COPY pom.xml .
+ RUN mvn -e -B  dependency:resolve
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
  
    $git checkout 10-fetch-dependencies-in-a-separate-step
  
 
    Build the container image
 
    $ docker build -t 10-fetch-dependencies-in-a-separate-step . 
 
 
    Run the container
 
    $ docker run 10-fetch-dependencies-in-a-separate-step
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

Improving Incremental build time / Leverage Build Cache?

[10-fetch-dependencies-in-a-separate-step](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/10-fetch-dependencies-in-a-separate-step)


## References:

  1.  [intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)

  2.  [reference-slides-of-the-blog-above](https://drive.google.com/file/d/16t_-DRTohzyVPJy6Cx8a3PxLQ-95CfYK/view)

  3.  [github-dockerfile-best-practices-nodejs](https://github.com/juan131/dockerfile-best-practices)
  
  4.  [dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)

