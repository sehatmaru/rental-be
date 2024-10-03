# Use an official OpenJDK 21 runtime as a parent image
FROM openjdk:21-jdk-slim

# Install Gradle
RUN apt-get update && apt-get install -y gradle

# Set the working directory inside the container
#WORKDIR /app

# Copy the Gradle project files into the container
#COPY build.gradle .
#COPY gradlew .
#COPY gradle ./gradle
#
## Download project dependencies
#RUN ./gradlew build --no-daemon
#
## Copy the project source code into the container
#COPY src ./src
#
## Build the Spring Boot application
#RUN ./gradlew build -x test --no-daemon
#
## Copy the .jar file to be run
#COPY build/libs/rental-1-SNAPSHOT.jar app.jar

CMD ["./gradlew", "clean", "bootJar"]
COPY build/libs/*.jar app.jar

# Expose the port your application will run on
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
