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
      // 테스트 결과 저장 (JUnit 형식 필요)
      junit 'build/reports/test-results.xml'

      // 실행 결과물 저장 (필요 시)
      archiveArtifacts artifacts: 'build/**/*.js', fingerprint: true
    }
  }
}
