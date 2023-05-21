# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.159.0/containers/cpp/.devcontainer/base.Dockerfile
# ARG VARIANT="buster"
# FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
# 20220321 自分でmongoを入れることとし、あとは実験用にimpurishを利用
# ↓ jammyはまだ日本語特価ライブラリが出ていませんでした失敗
# FROM ubuntu:jammy-20220315
# ↓ ついでにmongodbはLTSしか対応していない従って最高は20.04LTSに、つまりfocaklになります
# FROM ubuntu:impish-20220316
FROM ubuntu:focal-20220316
# 好きな名前に変更
ARG USERNAME=saya
# いずれ実験
# ARG BASEDIR="/wrk" --base-dir オプションで利用

# ARG HOMEDIR="/cpplab"
# 変更不可
ARG USER_UID=1000 
ARG USER_GID=$USER_UID 
# インタラクティブコマンドの不可
ENV DEBIAN_FRONTEND=noninteractive
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt update \
    && apt upgrade -y \
    && apt install -y sudo bash git zsh \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && chsh -s /usr/bin/zsh $USERNAME

# 2022/03/21 supervisorでデーモン起動
RUN apt install -y supervisor
RUN touch /etc/supervisord.conf
RUN echo '[supervisord]'  >> /etc/supervisord.conf
RUN echo 'nodaemon=true'  >> /etc/supervisord.conf


# USER $USERNAME
EXPOSE "20717" "33001" "33001" "33002" "33003" "33004" \
"33005" "33006" "33007" "33008" "33009" "33010" 

CMD /usr/bin/supervisord -c /etc/supervisord.conf
