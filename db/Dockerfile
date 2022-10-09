# 指定バージョンのelixir/Erlangが入ったベースイメージを使用
# https://hub.docker.com/layers/hexpm/elixir/1.8.2-erlang-22.3.4.23-ubuntu-focal-20210325/images/sha256-825e3361145e2394690e2ef94d6cc4587a7e91519ad002526d98156466d63643?context=explore
FROM postgres:11


# キャッシュファイル用ディレクトリ作成
RUN chmod 777 -R /var/lib/postgresql/data
EXPOSE 5432