FROM alpine:3.6

MAINTAINER doublebyte <joana.simoes@geocat.net>

RUN apk update && apk add bash

COPY ./wait-for-it.sh /wait-for-it.sh
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
