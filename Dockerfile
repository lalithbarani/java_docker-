# Use a Maven image to build the application
FROM maven:3.8.1-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file and the source code
COPY pom.xml .
COPY src ./src

# Package the application
RUN mvn clean package

# Output the contents of the /app/target directory
RUN ls -l /app/target

# Use an OpenJDK image to run the application
FROM openjdk:17-jdk-slim
# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app/myapp.jar
# Run the application
CMD ["java", "-jar", "myapp.jar"]
