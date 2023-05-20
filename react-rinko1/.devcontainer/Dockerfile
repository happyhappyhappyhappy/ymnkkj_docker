# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.159.0/containers/cpp/.devcontainer/base.Dockerfile
# ARG VARIANT="buster"
# FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
FROM phusion/baseimage:dev-jammy-1.1.0

# 好きな名前に変更
ARG USERNAME=rinko
# いずれ実験
# ARG BASEDIR="/wrk" --base-dir オプションで利用

# ARG HOMEDIR="/cpplab"
# 変更不可
ARG USER_UID=1000 
ARG USER_GID=$USER_UID 

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y sudo bash git zsh tini \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && chsh -s /usr/bin/zsh $USERNAME

EXPOSE 33011 33012 33013 33014 33015 33016 33017 33018 33019 33020