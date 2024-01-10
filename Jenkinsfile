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
      	sh 'mvn clean install -DskipTests=true'
      }
    }
    stage("build & SonarQube analysis") {
      agent any
      steps {
          withSonarQubeEnv('BaasSonarQube') {
            sh 'mvn clean package sonar:sonar'
          }
        }
    }
    stage("Quality Gate") {
        steps {
          timeout(time: 1, unit: 'HOURS') {
          waitForQualityGate abortPipeline: true
          }
        }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t abhinavreldynbaas/rd-baas-jenkins-deployment-sample .'
      }
    }
    stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'DockerHubCredentials', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push abhinavreldynbaas/rd-baas-jenkins-deployment-sample'
        }
      }
    }
  }
}
