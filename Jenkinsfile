pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-app'
    }

    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }

        stage('Docker Build - Staging') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:staging .'
            }
        }

        stage('Deploy - Staging') {
            steps {
                sh './deploy staging'
            }
        }

        stage('Sanity Check') {
            steps {
                input message: "Staging 배포 완료. Production 배포를 진행할까요?"
            }
        }

        stage('Docker Build - Production') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:production .'
            }
        }

        stage('Deploy - Production') {
            steps {
                sh './deploy production'
            }
        }
    }

    post {
        success {
            echo "✅ 배포 완료"
        }
        failure {
            echo "❌ 실패"
        }
    }
}
