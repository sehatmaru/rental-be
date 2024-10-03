## Use an official OpenJDK 21 runtime as a parent image
#FROM openjdk:21-jdk-slim
#
## Set the working directory inside the container
#WORKDIR /app
#
#RUN ./gradlew clean build -x test --no-daemon
#
## Copy the built Spring Boot jar into the container
#COPY ../build/libs/rental-1-SNAPSHOT.jar /app/app.jar
#
## Expose the port your application will run on
#EXPOSE 8080
#
## Run the application
#ENTRYPOINT ["java", "-jar", "/app/app.jar"]

# Stage 1: Build the application using OpenJDK 19 and Gradle
FROM openjdk:21-jdk-slim AS build
WORKDIR /app

# Copy Gradle build files and source code
COPY build.gradle settings.gradle ./
COPY gradlew .
COPY gradle gradle
COPY src src

# Set execution permission for the Gradle wrapper
RUN chmod +x ./gradlew

# Build the project and create the JAR
RUN ./gradlew clean build -x test

# Stage 2: Create the final Docker image using OpenJDK 19
FROM openjdk:21-jdk-slim
VOLUME /tmp

# Copy the JAR file from the build stage to the runtime stage
COPY --from=build /app/build/libs/rental-1-SNAPSHOT.jar app.jar

# Set the entrypoint to run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]
EXPOSE 8080