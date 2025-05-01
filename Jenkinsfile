pipeline {
  agent {
    docker { image 'node:18-alpine' }
  }
  stages {
    stage('Test') {
      steps {
        sh 'npm install'
        // npm test 에서 실패를 잡아서 UNSTABLE 로 전환
        catchError(buildResult: 'UNSTABLE', stageResult: 'UNSTABLE') {
          sh 'npm test'
        }
      }
    }
  }
  post {
    always {
      junit 'build/reports/test-results.xml'
    }
  }
}
