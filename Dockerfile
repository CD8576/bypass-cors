FROM node:20-slim AS base
RUN corepack enable
RUN corepack prepare pnpm@latest --activate
WORKDIR /app
RUN pnpm install
RUN pnpm build

CMD [ "pnpm", "start" ]
