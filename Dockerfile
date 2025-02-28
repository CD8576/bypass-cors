FROM node:20-slim AS base
RUN corepack enable
WORKDIR /app
RUN pnpm install
RUN pnpm build

CMD [ "pnpm", "start" ]
