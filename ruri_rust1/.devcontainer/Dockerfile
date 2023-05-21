FROM phusion/baseimage:dev-jammy-1.1.0 AS build

# 好きな名前に変更->nodeのイメージファイルは「node」のみ
ARG USERNAME=ruri
# いずれ実験
# ARG BASEDIR="/wrk" --base-dir オプションで利用

# ARG HOMEDIR="/cpplab"
# 変更不可
ARG USER_UID=1000 
ARG USER_GID=$USER_UID 

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update -qq \
    && apt-get upgrade -y \
    && apt-get install -y \ 
    sudo \
    bash \
    git  \
    zsh  \
    tini \
    wget \
    curl \
    language-pack-ja-base \
    language-pack-ja \
    locales \
    locales-all \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && chsh -s /usr/bin/zsh $USERNAME
# devcontainerの絡むところは勝手にentrypointを作成するので当面触れず
