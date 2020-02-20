FROM node:10-alpine
MAINTAINER walderston

LABEL h265ize_version="bleading edge" architecture="amd64"

RUN apk add --no-cache --update-cache git ffmpeg && \
    npm install Xeltor/h265ize --global --no-optional && \
    mkdir /watch

VOLUME ["/watch"]
WORKDIR /h265ize

ENTRYPOINT ["/usr/local/bin/h265ize", "-v", "/watch", "--delete"]
