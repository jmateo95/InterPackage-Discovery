FROM openjdk:17-jdk-buster
EXPOSE 8761
VOLUME /tmp
COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]