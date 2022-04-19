# ベースとなるDockerイメージ指定
FROM golang:latest

RUN apt-get update && apt-get install -y sudo
# RUN apt-get install -y sudo libmagickwand-dev
RUN apt-get update && apt-get install -y \
    locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen \
    && locale-gen
ENV LANG ja_JP.UTF-8

# コンテナ内に作業ディレクトリを作成
RUN mkdir /go/src/block
# コンテナログイン時のディレクトリ指定
WORKDIR /go/src/block
# ホストのファイルをコンテナの作業ディレクトリに移行
ADD ./block /go/src/block