FROM openjdk:12-alpine

COPY web/target/example-*.war /example.war

CMD["java","jar","/example.war"]
