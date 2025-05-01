pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test -- --watchAll=false'
            }
        }

        stage('Deploy - Staging') {
            steps {
                echo 'Deploying to staging...'
                sh './scripts/deploy.sh staging'
                sh './scripts/smoke-test.sh'
            }
        }

        stage('Sanity check') {
            steps {
                input "Staging 환경이 정상인가요? -> 프로덕션 배포 승인"
            }
        }

        stage('Deploy - Production') {
            steps {
                echo 'Deploying to production...'
                sh './scripts/deploy.sh production'
            }
        }
    }
}
