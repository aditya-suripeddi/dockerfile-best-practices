# Following best practices while writing Dockefile will help in five areas:

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


    1. Identify cacheable units such as apt-get update & install

    2. Build-from-source in a consistent environment

    3. Fetch dependencies in a spearate step

    4. Use multi-stage builds to remove build dependencies



## References:

  1.  [intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)

  2.  [reference-slides-of-the-blog-above](https://drive.google.com/file/d/16t_-DRTohzyVPJy6Cx8a3PxLQ-95CfYK/view)

  3.  [github-dockerfile-best-practices-nodejs](https://github.com/juan131/dockerfile-best-practices)


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
