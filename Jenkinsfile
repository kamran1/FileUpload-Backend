pipeline {
    agent any
    environment {
      registryCredential = 'dockerhub'
    }
    stages {
      stage('BuildJava') {
        agent { docker 'maven:3-alpine' }
        steps {
          sh 'mvn -B -DskipTests clean package'
          sh 'mvn package'
        }
      }
      stage('Build') {
        steps {
          sh 'docker build -t kamran/fileupload .'
        }
      }
      stage('Test') {
        steps {
          sh 'docker container run -p 8001:8080 --name fileuploadservice -d kamran/fileupload'
          sh 'curl -I http://localhost:8001'
        }
      }
      stage('Publish') {
        steps{
          script {
              docker.withRegistry( '', registryCredential ) {
                sh 'docker push kamran1205/diceproject:filebackend'
              }
          }
        }
      }
    }
  }