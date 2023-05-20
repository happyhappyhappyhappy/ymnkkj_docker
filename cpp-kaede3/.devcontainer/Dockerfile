# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.159.0/containers/cpp/.devcontainer/base.Dockerfile
# ARG VARIANT="buster"
# FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
FROM ubuntu:20.04

# 好きな名前に変更
ARG USERNAME=kaede
# いずれ実験
# ARG BASEDIR="/wrk" --base-dir オプションで利用

# ARG HOMEDIR="/cpplab"
# 変更不可
ARG USER_UID=1000 
ARG USER_GID=$USER_UID 

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt update \
    && apt upgrade -y \
    && apt install -y sudo bash git zsh tini \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
#    && apt clean \
#    && rm -rf /var/lib/apt/lists/* \
    && chsh -s /usr/bin/zsh $USERNAME

COPY ../loginnew.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/loginnew.sh
# 2022/03/19 バックでデーモンプロセスを使いたい場合に対して、supervisiorをセットする
# RUN apt install -y supervisor
# RUN echo '[supervisord]'  >> /etc/supervisor/supervisord.conf
# RUN echo 'nodaemon=true'  >> /etc/supervisor/supervisord.conf

# EXPOSE 33011 33012 33013 33014 33015 33016 33017 33018 33019 33020
# USER $USERNAME
ENTRYPOINT [ "/usr/bin/tini","-e","143","--", ]
CMD ["zsh","/usr/local/bin/loginnew.sh"]