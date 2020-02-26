# backupcode


1. install and use sonar : 

sudo wget http://www.sonatype.org/downloads/nexus-latest-bundle.zip
sudo chmod 777 nexus-2.11.4-01-bundle.zip
sudo unzip nexus-2.11.4-01-bundle.zip
cd nexus-2.11.4-01/bin
sudo RUN_AS_USER=root ./nexus start


2. config server :

sudo vim $M2_HOME/conf/settings.xml

 <server>
      <id>nexus</id>
      <username>admin</username>
      <password>admin123</password>
    </server>

3. Start sonar: 

cd nexus-2.14.16-01/bin
sudo RUN_AS_USER=root ./nexus start


nexus name : admin
nexus pass : admin123


remove all remote tags :     			sh script: 'git tag -l | xargs -n 1 git push --delete origin'
