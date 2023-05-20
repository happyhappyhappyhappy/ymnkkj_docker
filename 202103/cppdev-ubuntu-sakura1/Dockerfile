FROM alpine:3.12.4
# ユーザーsakuraを作成した上で環境作成 20210307
RUN apk update && \
    apk add --no-cache bind-tools && \
    apk add --no-cache alpine-sdk cmake clang && \
    apk add --no-cache libressl-dev vim bash shadow
RUN addgroup -g 10001 -S nonroot && adduser --shell /bin/bash -u 10000 -S -G nonroot /home/sakura sakura
USER sakura