pipeline {
	agent any
	options {
		buildDiscarder(logRotator(numToKeepStr: '3', artifactNumToKeepStr: '3'))
	}


	stages {
		stage ('Starting Sonar') {
			steps{
		    	build job: 'Sonar'
			}
		}
		stage('Build'){
			steps {
				sh "mvn clean verify"
			}
		}

		stage('test'){
			steps{
				sh script: "JENKINS_NODE_COOKIE=dontKillMe && sh run.sh"
		  	}
		}

	}
}