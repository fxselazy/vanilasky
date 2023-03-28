FROM node:16.14-alpine3.14
WORKDIR /usr/src/app
COPY package.json ./
COPY . .
RUN npm install
EXPOSE 8080
CMD [ "npm", "run", "serve" ]