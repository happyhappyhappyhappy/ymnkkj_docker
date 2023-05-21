FROM phusion/baseimage:jammy-1.0.1
# 2023/04/10 RockyLinux9で作ろうと思ったが日本語化でNG
# ohzshrcで失敗→これは別途プロジェクトとして行おう
# 好きな名前に変更
ARG USERNAME=aria
# いずれ実験
# ARG BASEDIR="/wrk" --base-dir オプションで利用

# ARG HOMEDIR="/cpplab"
# 変更不可
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# # phusion独自のinitを実行
CMD ["/sbin/my_init"]
# # memcachedを使いたい
RUN mkdir /etc/service/memcached
ADD ../memcached.sh /etc/service/memcached/run

# # my_init.dを使って実行させたい
RUN mkdir -p /etc/my_init.d
# COPY ../logtime.sh /etc/my_init.d/logtime.sh
# RUN chmod +x /etc/my_init.d/logtime.sh

# # kill時間対策
# # Give children processes 5 minutes to timeout
ENV KILL_PROCESS_TIMEOUT=300
# # Give all other processes (such as those which have been forked) 5 minutes to timeout
ENV KILL_ALL_PROCESSES_TIMEOUT=300

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    sudo \
    bash \
    zsh \
    tini \
    curl \
    wget \
    git \
    python3 \
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
