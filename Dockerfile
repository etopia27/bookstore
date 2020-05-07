FROM openjdk:8
ARG JAR_FILE=target/*.jar
RUN apt-get update
COPY ${JAR_FILE} bookstore.jar
ENTRYPOINT ["java","-jar","bookstore.jar"]
EXPOSE 9091
CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseG1GC", "-XX:+UseStringDeduplication", "-XX:MaxRAMFraction=2", "-jar", "bookstore.jar"]
 