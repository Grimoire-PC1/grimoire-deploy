FROM node:20-alpine

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git

WORKDIR /home/node/app

RUN mkdir -p node_modules && chown -R node:node .

# Clona diretamente o repositório do GitHub
RUN git clone https://github.com/Grimoire-PC1/image-manager.git && \
    (cd image-manager)

RUN chown -R node:node /home/node/app/image-manager/

WORKDIR /home/node/app/image-manager/

USER node

RUN npm install

EXPOSE 5000

CMD ["npm", "run", "dev", "--", "--host"]