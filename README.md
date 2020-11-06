# Remove Unnecessary dependencies | Reduce Image Size

Remove unnecessary dependencies and do not install debugging tools. If needed debugging tools
can always be installed later. Certain package managers such as apt, automatically install 
packages that are recommended by the user-specified package, unnecessarily increasing the
footprint. Apt has the –no-install-recommends flag which ensures that dependencies that were
not actually needed are not installed. If they are needed, add them explicitly.


```diff
FROM debian
# Install required system packages
- RUN apt-get update \
-     && apt-get -y install \
-     openjdk-11-jdk ssh emacs
+ RUN apt-get update \
+     && apt-get -y install --no-install-recommends \
+     openjdk-11-jdk
# Copy required jar file 
COPY target/app.jar /app
# Run jar file
CMD ["java", "-jar", "/app/app.jar"]   
```


## Commands to Run: 

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

