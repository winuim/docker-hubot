FROM node:alpine
LABEL maintainer="Yohei Uema <winuim@gmail.com>"
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN find /app -type f -exec chmod -x {} \;
# Update & Install Requirments Packages.
RUN apk update && apk add \
    bash \
    shadow \
    tzdata \
    && rm -rf /var/cache/apk/* \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && npm install -g yo generator-hubot coffeescript \
    && groupadd -r hubot && useradd -m -r -g hubot hubot \
    && chown -R hubot:hubot /app \
    && chmod +x entrypoint.sh

USER hubot
ARG HUBOT_OWNER
RUN yo hubot --owner="${HUBOT_OWNER}" --name="Hubot" --description="Delightfully aware robutt" --adapter=slack --defaults

# Run
ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "run" ]
