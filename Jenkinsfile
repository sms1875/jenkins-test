pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-vite-app"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Run Container (Staging)') {
            steps {
                sh """
                docker rm -f vite-staging || true
                docker run -d --name vite-staging -p 5173:5173 ${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }

        stage('Sanity Check') {
            steps {
                input "✅ 확인되셨으면 'Continue'를 눌러 주세요."
            }
        }

        stage('Run Container (Production)') {
            steps {
                sh """
                docker rm -f vite-prod || true
                docker run -d --name vite-prod -p 8000:80 ${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }
    }

    post {
        always {
            echo "✅ 파이프라인 종료됨"
        }
    }
}
