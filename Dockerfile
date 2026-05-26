FROM node:24-trixie-slim AS production

WORKDIR /app

COPY --chown=nodejs:nodejs . .
RUN yarn install --frozen-lockfile

EXPOSE 3001

CMD ["node", "app.js"]
