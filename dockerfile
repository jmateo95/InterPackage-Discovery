FROM openjdk:17-jdk-buster
EXPOSE 8761
VOLUME /tmp
ADD target/discovery-automation.jar discovery-automation.jar
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]