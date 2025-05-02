#!/bin/bash
ENV=$1

APP_NAME=my-app-${ENV}

# 기존 컨테이너 종료 및 삭제
docker rm -f $APP_NAME 2>/dev/null

# 새 컨테이너 실행
docker run -d --name $APP_NAME -p ${PORT:-8080}:80 my-app:$ENV

echo "$ENV 환경에 배포 완료"
