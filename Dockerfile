FROM node:20-slim AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN npm install --global corepack@latest
RUN corepack enable pnpm

RUN pnpm build

EXPOSE 8000
CMD [ "pnpm", "start" ]
