# 1. Build 단계
FROM node:20 AS build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# 2. Serve 단계
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

# optional: custom nginx config
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
