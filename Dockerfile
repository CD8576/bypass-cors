FROM node:20-slim AS base
RUN corepack enable
WORKDIR /app
RUN npm install
RUN npm build

CMD npm start
