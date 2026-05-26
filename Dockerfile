FROM 24-trixie-slim:latest AS production

WORKDIR /app
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001 -G nodejs

RUN npm install -g yarn

COPY --chown=nodejs:nodejs . .
RUN yarn install --frozen-lockfile
RUN chown -R nodejs:nodejs /app

USER nodejs
EXPOSE 3001

CMD ["node" "app.js"]
