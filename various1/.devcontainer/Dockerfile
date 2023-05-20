# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.159.0/containers/cpp/.devcontainer/base.Dockerfile
# ARG VARIANT="buster"
# FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#
#    && apt-get -y install --no-install-recommends <your-package-list-here>
# pypy3専用の環境pyotu1=>もしpython3やdjungo扱いたければ別途環境を作ること
# FROM phusion/baseimage:jammy-1.0.1
FROM ubuntu:kinetic
# 好きな名前に変更
ARG USERNAME=saori
# いずれ実験
# ARG BASEDIR="/wrk" --base-dir オプションで利用

# ARG HOMEDIR="/cpplab"
# 変更不可
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# # phusion独自のinitを実行
# CMD ["/sbin/my_init"]
# # memcachedを使いたい
# RUN mkdir /etc/service/memcached
# ADD ../memcached.sh /etc/service/memcached/run

# # my_init.dを使って実行させたい
# RUN mkdir -p /etc/my_init.d
# COPY ../logtime.sh /etc/my_init.d/logtime.sh
# RUN chmod +x /etc/my_init.d/logtime.sh

# # kill時間対策
# # Give children processes 5 minutes to timeout
# ENV KILL_PROCESS_TIMEOUT=300
# # Give all other processes (such as those which have been forked) 5 minutes to timeout
# ENV KILL_ALL_PROCESSES_TIMEOUT=300

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    sudo \
    bash \
    git \
    zsh \
    tini \
    curl \
    wget \
    git \
    language-pack-ja-base \
    language-pack-ja \
    locales locales-all \
    gnupg \
    gnupg2 \
    gnupg1 \
    build-essential \
    cmake \
    clang \
    libssl-dev \
    vim \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && chsh -s /usr/bin/zsh $USERNAME
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
# COPY ./mysupervisord.conf /etc/supervisor/.
# COPY ./supervisor.sh /etc/supervisor/.
# RUN chmod 644 /etc/supervisor/supervisor.sh
# 2022/03/19 バックでデーモンプロセスを使いたい場合に対して、supervisiorをセットする

# EXPOSE 33011 33012 33013 33014 33015 33016 33017 33018 33019 33020

# ENTRYPOINT [ "/usr/bin/tini","-e","143","--", ]
# CMD ["zsh","/etc/supervisor/supervisor.sh"]
