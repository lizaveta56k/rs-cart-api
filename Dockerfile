FROM node:14-alpine
COPY package*.json ./
RUN npm install && npm cache clean --force
COPY src ./
RUN npm run build
USER node
EXPOSE 4000
ENTRYPOINT ["node", "dist/main.js"]