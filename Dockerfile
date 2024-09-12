ARG NODE_VERSION=22.8.0

FROM node:${NODE_VERSION}

WORKDIR /usr/src/app

# ENV CERTIFICATE_KEY=localhost.key
# ENV CERTIFICATE_CERT=localhost.cert

COPY package*.json ./

RUN yarn

USER node

COPY . .

EXPOSE 80

CMD yarn start
