pipeline {
	agent any
	options {
		buildDiscarder(logRotator(numToKeepStr: '3', artifactNumToKeepStr: '3'))
	}


	stages {
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
		stage('Git config') {
			steps{
        		sh script: 'git config --global user.name "andrei414"'
        		sh script: 'git config --global user.email "andreiirimiagg@gmail.com"'
        	}	
    	}
		stage('Release') {
			steps{
        		sh script: 'mvn clean -s  settings.xml --batch-mode release:clean release:prepare release:branch -DbranchName=release-branch'
    		}
    	}
    	stage('upload to nexus') {
    		steps{
    			sh script: 'mvn clean -s settings.xml deploy -Dmaven.test.skip=true'
    		}
    	}
    	stage ('Starting Sonar') {
			steps{
		    	build job: 'SonarTestEnv'
			}
		}	
	}
}