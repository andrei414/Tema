pipeline {
	environment {
    registry = "andrei414/webdemo"
    registryCredential = 'dockerhub'
	}
	agent any
	options {
		buildDiscarder(logRotator(numToKeepStr: '3', artifactNumToKeepStr: '3'))
	}


	stages {
		stage('Build'){
			steps {
				sh "mvn clean verify -DskipTests"
			}
		}
		stage('Git config') {
			steps{
        		sh script: 'git config --global user.name "andrei414"'
        		sh script: 'git config --global user.email "andreiirimiagg@gmail.com"'
        	}	
    	}
		stage('Release') {
			steps{
        		sh script: 'mvn clean -s  settings.xml --batch-mode release:clean release:prepare'
    		}
    	}
    	stage('upload to nexus') {
    		steps{
    			sh script: 'mvn clean -s settings.xml deploy -U -Dmaven.test.skip=true'
    		}
    	}
    	stage ('Starting Sonar') {
			steps{
		    	build job: 'SonarTestEnv'
			}
		}
		stage ('Docker build image'){
			steps{
				sh 'docker build -t andrei414/webdemo:1.0.0-SNAPSHOT .'
				sh 'docker run -d -p 8080:8080 andrei414/webdemo:1.0.0-SNAPSHOT'
			}
		}
		stage ('Docker push'){
			steps{
				sh 'docker login -u "andrei414" -p "Test12345" docker.io'
				sh 'docker push andrei414/webdemo:1.0.0-SNAPSHOT'
			}
		}
	}
}