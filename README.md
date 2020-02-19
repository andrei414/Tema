# README #

to run :
cd web; nohup mvn spring-boot:run & 

to keep the process alive :
sh script: "JENKINS_NODE_COOKIE=dontKillMe && sh run.sh"

sonarqube integration (clover code coverage)
Created secondary pipeline to run sonarqube code coverage 
