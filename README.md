
# Dockerfile best practices



This repository walks you through writing a better Dockerfile for a maven java project by applying best practices
and concepts discussed in [dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)


A better Dockerfile is written as you go from master branch to [1-order-matters-for-caching](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/1-order-matters-for-caching) till you reach [11-multi-stage-builds-to-remove-build-deps](https://github.com/aditya-suripeddi/dockerfile-best-practices/tree/11-multi-stage-builds-to-remove-build-deps)


The mater branch also has a python flask rest app, to show how to write Dockerfile for a python project


## Following Dockerfile best practices will help in five areas:

    1. Incremental build time
    
    2. Image size
    
    3. Maintainability
    
    4. Security (pending)
    
    5. Repeatability


## Improving incremental build time:

    1. Order matters for caching
    
    2. More specific COPY to limit cache busts


## Reduce Image size:

     1. Remove unnecessary dependencies
     
     2. Remove package manager cache


## Maintainability:


    1. Use official images when possible
   
    2. Use more specific tags

    3. Look for more minimal flavors


## Reproducibility:


    1. Line buddies: apt-get update & install in singe RUN statement?

    2. Build-from-source in a consistent environment

    3. Fetch dependencies in a spearate step

    4. Use multi-stage builds to remove build dependencies


## Running the java project in docker container


```
   Install docker and run the docker daemon

   $ sudo dockerd &    


   Clone the repository 

   $ git clone https://github.com/aditya-suripeddi/dockerfile-best-practices.git


   Go to the project directory 

   $ cd dockerfile-best-practices


   Build the container image

   $ docker build -t java-app . 


   Run the container

   $ docker run java-app
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

  3.  [github-dockerfile-best-practices-nodejs](https://github.com/juan131/dockerfile-best-practices): <em> the presentation format with different github branches is taken from here </em>
  
  4.  [dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)

  5.  [dockerdocs-dockerfile-best-practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

  6. [hexops-dockerfile-best-practices](https://github.com/hexops/dockerfile)
