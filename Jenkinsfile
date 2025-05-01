pipeline {
    agent any

    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
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
