FROM openjdk:12-alpine

COPY web/target/web-*.war /web.war

CMD ["mvn springboot:run"]

