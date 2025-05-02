# base image
FROM node:20

# app directory
WORKDIR /app

# install deps
COPY package*.json ./
RUN npm install

# copy source
COPY . .

# build app
RUN npm run build

# install lightweight HTTP server for static files
RUN npm install -g serve

# expose port
EXPOSE 80

# start app
CMD ["serve", "-s", "dist", "-l", "80"]
