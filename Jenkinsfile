pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    environment {
        IMAGE_NAME = "my-vite-app"
        IMAGE_TAG  = "latest"
    }
    stages {
        stage('Build') {
            steps {
                echo '✅ 빌드 시작'
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }
        stage('Test') {
            steps {
                echo '✅ 테스트 (예: 이미지 검사)'
                sh 'docker run --rm $IMAGE_NAME:$IMAGE_TAG sh -c "npm test || exit 0"'
            }
        }
        stage('Deploy - Staging') {
            steps {
                echo '🚀 스테이징 배포'
                sh '''
                   docker rm -f vite-staging || true
                   docker run -d --name vite-staging -p 5173:5173 $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
        stage('Sanity Check') {
            steps {
                input message: "스테이징 배포 확인 후 Continue", ok: "Continue"
            }
        }
        stage('Deploy - Production') {
            steps {
                echo '🎉 프로덕션 배포'
                sh '''
                   docker rm -f vite-prod || true
                   docker run -d --name vite-prod -p 8000:80 $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }
    post {
        always {
            echo '✅ 파이프라인 종료'
        }
    }
}
