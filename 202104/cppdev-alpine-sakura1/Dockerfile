FROM alpine:3.13.4
# これを自作用テンプレートにする予定
# ユーザーsakuraを作成した上で環境作成 20210307
# yamanakaに変更 20210307
ENV LANG en_US.utf8 
# 20210405 https://qiita.com/yachinco/items/21564836d6772fe0e4ed を参考
RUN apk update && \
    apk add --no-cache bind-tools tzdata sudo && \
    apk add --no-cache coreutils alpine-sdk cmake clang && \
    apk add --no-cache libressl-dev vim bash shadow git && \
    apk add --no-cache openssl openssh
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN adduser -D -u 10001  -s /bin/bash -G adm -h /cpplab yamanaka 
RUN echo '%adm ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
