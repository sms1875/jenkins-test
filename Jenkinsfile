pipeline {
  agent any
  stages {
    stage('stage 1') {
      steps {
        sh 'echo stage 1'
      }
    }
    stage('stage 2') {
      steps {
        retry(5) {
          sh './test-script.sh'
        }
      }
    }
    stage('stage 3') {
      steps {
        sh 'echo stage 3'
      }
    }
  }
}
