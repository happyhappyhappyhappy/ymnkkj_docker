FROM almalinux:latest
# 作成 2023/04/27
# almalinuxの事前設定した内容を全て反映させた物
# brewの為に作ってみた

# 変数設定
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
ARG USERNAME=tsubasa8
ENV DEBIAN_FRONTEND=noninteractive
# 第一ステージ:基本設定
RUN yum update -y \
	&& yum upgrade -y \
	&& yum -y install sudo zsh \
	&& dnf update \
	&& dnf -y install util-linux-user \
#	&& groupadd --gid ${USER_GID} ${USERNAME} \
	&& useradd --uid ${USER_UID} --create-home --shell /usr/bin/zsh -G wheel,root ${USERNAME} \
	&& echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# 第二ステージ:開発環境を想定したアプリを全部インストールする
# 自動実行でエラーが出るようなら手動で行うしか無い
RUN dnf -y groupinstall base \
    && dnf -y groupinstall development \
	&& dnf -y groupinstall network-tools \
	&& dnf update

# 第三ステージ localeに関わるところをインストール
ENV LANG C
RUN dnf -y install glibc-locale-source langpacks-en glibc-langpack-en glibc-langpack-ja
# 後は手動で設定

# 試しに埋め込んでみる
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
