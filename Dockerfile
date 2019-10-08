FROM mhart/alpine-node:12

RUN apk add --no-cache git sed

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
