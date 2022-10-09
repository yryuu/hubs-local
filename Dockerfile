# 指定バージョンのelixir/Erlangが入ったベースイメージを使用
# https://hub.docker.com/layers/hexpm/elixir/1.8.2-erlang-22.3.4.23-ubuntu-focal-20210325/images/sha256-825e3361145e2394690e2ef94d6cc4587a7e91519ad002526d98156466d63643?context=explore
FROM hexpm/elixir:1.8.2-erlang-22.3.4.23-ubuntu-focal-20210325

# ディレクトリの設定
ARG ROOT_DIR=/ret
RUN mkdir ${ROOT_DIR}
WORKDIR ${ROOT_DIR}

# ディレクトリのコピー
COPY ./reticulum ${ROOT_DIR}

# 依存するライブラリのインストール
RUN apt-get update && apt-get install -y git inotify-tools
RUN mix local.hex --force && mix local.rebar --force && mix deps.get

# キャッシュファイル用ディレクトリ作成
RUN mkdir -p /storage/dev && chmod 777 /storage/dev

EXPOSE 4000