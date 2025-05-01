pipeline {
  agent {
    docker {
      image 'node:18-alpine'
    }
  }

  stages {
    stage('Test') {
      steps {
        sh 'npm install'
        sh 'npm test'
      }
    }
  }

  post {
    always {
      junit 'build/reports/test-results.xml'
    }
  }
}
