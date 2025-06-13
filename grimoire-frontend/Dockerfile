# frontend/Dockerfile
FROM node:20-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git

WORKDIR /home/node/app

RUN mkdir -p node_modules && chown -R node:node .

RUN git clone https://github.com/Grimoire-PC1/grimoire-frontend.git && \
    (cd grimoire-frontend && git checkout $GRIMOIRE_FRONTEND)

WORKDIR /home/node/app/grimoire-frontend/

RUN npm install

RUN chown -R node:node /home/node/app/grimoire-frontend/

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]