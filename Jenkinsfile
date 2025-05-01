pipeline {
  agent {
    docker { image 'node:18-alpine' }
  }
  stages {
    stage('Install') {
      steps {
        sh 'npm install'
      }
    }
    stage('Test') {
      steps {
        // 테스트 실패 시 UNSTABLE 처리
        catchError(buildResult: 'UNSTABLE', stageResult: 'UNSTABLE') {
          sh 'npm test'
        }
      }
    }
  }
  post {
    always {
      junit 'build/reports/test-results.xml'
      archiveArtifacts artifacts: 'build/reports/test-results.xml', fingerprint: true
    }
  }
}
