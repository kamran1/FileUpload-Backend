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
          sh 'docker build -t kamran1205/fileupload .'
        }
      }
      stage('Test') {
        steps {
          sh 'docker container rm -f fileuploadservice'
          sh 'docker container run -p 8001:8080 --name fileuploadservice -d kamran1205/fileupload'
          sh 'curl -I http://localhost:8080/upload'
        }
      }
      stage('Publish') {
        steps{
          script {
              docker.withRegistry( '', registryCredential ) {
                sh 'docker push kamran1205/fileupload'
              }
          }
        }
      }
    }
  }