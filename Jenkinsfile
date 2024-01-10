#!groovy
pipeline {
	agent none
  stages {
  	stage('Maven Install') {
    	agent {
      	docker {
        	image 'maven:latest'
          args '-u root'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
  }
}
