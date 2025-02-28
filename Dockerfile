# specify the node base image with your desired version node:<version>
FROM node:18-alpine

ARG NODE_ENV=production
RUN pnpm install
WORKDIR /usr/src/app

COPY . .

RUN npm ci
RUN pnpm dev
EXPOSE 3000
RUN pnpm build
# Start cron service and your application
CMD pnpm start





