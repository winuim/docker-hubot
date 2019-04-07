FROM node:alpine

ARG HUBOT_OWNER="changeme"

RUN set -x && apk update && apk add \
    bash \
    shadow \
    tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && useradd -m hubot \
    && npm install -g yo generator-hubot

USER hubot
WORKDIR /home/hubot

RUN set -x && \
    yo hubot --owner=$HUBOT_OWNER --name="Hubot" --description="Delightfully aware robutt" --adapter=slack --defaults

ENV HUBOT_SLACK_TOKEN="xoxb-"
CMD ["bin/hubot", "-a", "slack"]
