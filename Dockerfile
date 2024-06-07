ARG NODE_VERSION=20.12.0

FROM node:${NODE_VERSION}-alpine

# ENV NODE_ENV production

WORKDIR /usr/src/app

COPY package*.json ./

# RUN npm i
RUN yarn

# RUN --mount=type=bind,source=package.json,target=package.json \
#     --mount=type=bind,source=yarn.lock,target=yarn.lock \
#     --mount=type=cache,target=/root/.yarn \
#     yarn install --production --frozen-lockfile


USER node

COPY . .

ENV CERTIFICATE_KEY=localhost.key
ENV CERTIFICATE_CERT=localhost.cert

EXPOSE 80

CMD yarn start
