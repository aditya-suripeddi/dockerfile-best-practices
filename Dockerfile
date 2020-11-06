# Use more specific tags:
#     openjdk:latest -> openjdk:8
#
# The 'latest' tag is a rolling tag. Be specific, to
# prevent unexpected changes in your base image
FROM openjdk:8
COPY target/app.jar /app/
CMD ["java", "-jar", "/app/app.jar" ]
