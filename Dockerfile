FROM node:16

RUN mkdir -p /opt/app

ENV NODE_ENV production

WORKDIR /opt/app

COPY ./dist/apps/web/package.json /opt/app

RUN yarn install --production

COPY ./dist/apps/web /opt/app

RUN yarn next telemetry disable

CMD [ "yarn", "start" ]
