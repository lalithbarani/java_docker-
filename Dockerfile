FROM maven:3.8.4-openjdk-21 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Run Maven to compile the Java code
RUN mvn clean package

# Specify the command to run your application
CMD ["java", "-jar", "target/*.jar"]
