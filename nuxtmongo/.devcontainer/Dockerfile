FROM node:17.9.0-alpine3.15
ARG USERNAME=sanma
ARG USER_UID=1000 
ARG USER_GID=$USER_UID 
EXPOSE 33021
ENV HOST 0.0.0.0

# コマンド実行
RUN apk update zsh && \
    apk add git sudo && \
    npm install -g @vue/cli nuxt create-nuxt-app
RUN adduser -D -u ${USER_UID} -s /usr/bin/zsh -G ${USER_GID} ${USERNAME}
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
# コマンド実行
    
