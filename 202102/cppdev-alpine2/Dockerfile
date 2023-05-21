FROM alpine:3.12.4


# RUN addgroup -g 10001 -S momo && adduser -u 10000 -S -G momo -h /home/momo momo
RUN apk add --no-cache bind-tools
RUN apk update && \
    apk add --no-cache alpine-sdk cmake clang libressl-dev vim bash shadow
