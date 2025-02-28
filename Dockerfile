FROM node:20-slim AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS prod

COPY pnpm-lock.yaml /app

RUN pnpm fetch --prod

RUN pnpm run build

FROM base
COPY --from=prod /app/node_modules /app/node_modules
EXPOSE 8000
CMD [ "pnpm", "start" ]
