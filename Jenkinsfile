pipeline {
    agent any
    stages {
        stage('No-op') {
            steps {
                sh 'ls'
            }
        }
    }
    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
        success {
            sh """
            curl -X POST -H 'Content-Type: application/json' \
            -d '{
                "text": "✅ 파이프라인 ${env.JOB_NAME} #${env.BUILD_NUMBER} 이(가) 성공적으로 완료되었습니다."
            }' https://meeting.ssafy.com/hooks/e4uu4j8sc3yz3fj8yqfqhazq5a
            """
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
    }
}
