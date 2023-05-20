FROM fedora:39
# 2023/04/16 fedoraOSを作成してみる
# 好きな名前に変更
ARG USERNAME=aika
# 変更不可
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN dnf check-update \
    && dnf -y upgrade \
    && dnf -y install  \
    sudo \
    bash \
    zsh \
    curl \
    wget \
    git \
    && groupadd --gid $USER_GID $USERNAME \
    && useradd --uid ${USER_UID} --create-home --shell /usr/bin/zsh -G wheel,root ${USERNAME}
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
