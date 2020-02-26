FROM openjdk:12-alpine

COPY web/target/example.smallest-*.war /example.war

RUN ["java","jar","/example.war"]
