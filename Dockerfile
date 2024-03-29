FROM node:18 as builder

WORKDIR /app

COPY ["package*.json", "./"]

USER 0

RUN npm ci --production

USER node

COPY . .


FROM node:18-slim

USER node

COPY --from=builder /app /app

WORKDIR /app

EXPOSE 8001

CMD ["npm", "start"]