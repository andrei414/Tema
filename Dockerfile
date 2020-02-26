FROM openjdk:12-alpine

COPY web/target/example.smallest-*.war /example.war

CMD["java","jar","/example.war"]
