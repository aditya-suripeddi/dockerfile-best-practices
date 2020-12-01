# More specific COPY to limit cache busts | Improving incremental build time

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


## Commands to run 

```
   Install docker and run the docker daemon

   $ sudo dockerd &    


   Clone the repository 

   $ git clone https://github.com/aditya-suripeddi/dockerfile-best-practices.git


   Go to the project directory 

   $ cd dockerfile-best-practices

   Checkout to branch 
 
   $git checkout 2-more-specific-copy-to-limit-cache-busts 
 

   Build the container image

   $ docker build -t 2-more-specific-copy-to-limit-cache-busts . 


   Run the container

   $ docker run 2-more-specific-copy-to-limit-cache-busts
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
