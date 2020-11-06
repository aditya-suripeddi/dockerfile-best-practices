# Remove Unnecessary dependencies

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


## Reference: 

[intro-guide-to-dockerfile-best-practices](https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/)
[dockerfile-best-practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=391s)
