# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.159.0/containers/cpp/.devcontainer/base.Dockerfile
# ARG VARIANT="buster"
# FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
FROM ubuntu:focal

# 好きな名前に変更
ARG USERNAME=kaede
# いずれ実験
# ARG BASEDIR="/wrk" --base-dir オプションで利用

ARG HOMEDIR="/cpplab"
# 変更不可
ARG USER_UID=1000 
ARG USER_GID=$USER_UID 

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m -d $HOMEDIR $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt update \
    && apt upgrade -y \
    && apt install -y sudo bash git \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && chsh -s bash $USERNAME
USER $USERNAME