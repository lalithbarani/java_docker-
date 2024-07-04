# Use a base image with OpenJDK
FROM openjdk:21-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file from the host to the container
COPY target/*.jar app.jar

# Specify the command to run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
