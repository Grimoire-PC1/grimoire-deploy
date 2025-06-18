# frontend/Dockerfile
FROM node:20-alpine

ARG GRIMOIRE_FRONTEND

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git

WORKDIR /home/node/app

RUN mkdir -p node_modules && chown -R node:node .

RUN git clone https://github.com/Grimoire-PC1/grimoire-frontend.git && \
    (cd grimoire-frontend && git checkout $GRIMOIRE_FRONTEND)

RUN chown -R node:node /home/node/app/grimoire-frontend/

WORKDIR /home/node/app/grimoire-frontend/

USER node

RUN npm install

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]