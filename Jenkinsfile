pipeline {
  agent any
  environment {
    NODE_ENV = 'test'
    API_URL = 'https://api.example.com'
  }
  stages {
    stage('stage 1') {
      steps {
        sh 'echo "환경: $NODE_ENV"'
      }
    }
    stage('stage 2') {
      environment {
        NODE_ENV = 'production'
      }
      steps {
        sh './test-script.sh'
      }
    }
    stage('stage 3') {
      steps {
        sh 'echo "API 호출: $API_URL"'
      }
    }
  }
}
