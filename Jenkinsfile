pipeline {
  agent any
    environment {
      registryCredential = 'dockerhub'
    }
    stages {
      stage('Build') {
        steps {
          sh 'docker build -t kamran/fileupload .'
        }
      }
      stage('Test') {
        steps {
          sh 'docker container rm -f node'
          sh 'docker container run -p 8001:8080 --name node -d kamran/fileupload'
          sh 'curl -I http://localhost:8001'
        }
      }
      stage('Publish') {
        steps{
          script {
              docker.withRegistry( '', registryCredential ) {
                sh 'docker push kamran/fileupload:latest'
              }
          }
        }
      }
    }
  }