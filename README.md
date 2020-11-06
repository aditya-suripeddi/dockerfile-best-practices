# Order matters for caching | Improving incremental build time

In a development cycle, when building a Docker image, making code changes, then rebuilding, it 
is important to leverage caching. Caching helps to avoid running build steps again when they don’t need to.


However, the order of the build steps (Dockerfile instructions) matters, because when a step’s cache
is invalidated by changing files or modifying lines in the Dockerfile, subsequent steps of their 
cache will break. Order your steps from least to most frequently changing steps to optimize caching.


```diff
FROM debian
- # Copy application files
- COPY . /app
# Install required system packages
RUN apt-get update
RUN apt-get -y install openjdk-11-jdk ssh emacs
+ # Copy application files
+ COPY . /app
# Run jar file
CMD ["java", "-jar", "/app/target/app.jar"]   
```

Now even if there are some changes made in application files / project files 
docker build will take less time as RUN instructions are cached and reused
while building

## Commands to run 

```
   Install docker and run the docker daemon

   $ sudo dockerd &    


   Clone the repository 

   $ git clone https://github.com/aditya-suripeddi/dockerfile-best-practices.git


   Go to the project directory 

   $ cd dockerfile-best-practices

   Checkout to branch 
 
   $git checkout 1-order-matters-for-caching 
 

   Build the container image

   $ docker build -t order-matters-for-caching . 


   Run the container

   $ docker run order-matters-for-caching
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
