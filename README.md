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

 To run the project in a docker container: 
```
   $ docker build -t build-from-source .
      ...
      ...
   $ docker run build-from-source 
```


## Reference: 

[intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)

[dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)


## Next best practice 

