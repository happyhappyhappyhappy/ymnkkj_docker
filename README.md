# wsl2-ubuntuで作成したdockerの為のプロジェクト 
[コマンドリンク](https://docs.docker.com/engine/reference/commandline/docker/)
## 20210306確認
イメージ作成済みからdockerコンテナを作成する
「alpine_sandbox:1.0」としてイメージは作成完了
~~~ 
docker run --init --name "alpine_sandbox0" -it alpine_sandbox:1.0
~~~
ここで入った場合、Linuxのコマンドラインに戻るには「Ctrl+p -> Ctrl+q」を使う。「detatch」と同じ作業をする。
**決してexitで終わってはいけない**
なぜなら、コンテナそのものが終了してしまうから。
次に入るときはexecオプションで入る
~~~
docker exec -it alpine_sandbox0 /bin/sh
~~~
こうしたとき、exitで抜けても上がったままなので最終的に止めるには

~~~
docker stop alpine_sandbox0
~~~
で終了する。

と思うがもう一度チェックする。

次の実験はrunコマンドに-dコマンドを入れ、-itを外してみる。
こうするとこのコマンドではexecで入りexitで抜けることが出来るかも。


あと、しばらくはハイフン二つ使った単語オプションで行こう。

## 2021/03/19確認
失敗した。当面今まで通り。ログはこの通り

```
$ docker run --init --name "alpine_sandbox1" --detach alpine_sandbox:1.0
07a42e9b98acfdd61e557a477c176cac300b2ad94984fe2dfcdea22c5b1518cb
$ docker ps -a
CONTAINER ID   IMAGE                COMMAND     CREATED          STATUS                     PORTS     NAMES
07a42e9b98ac   alpine_sandbox:1.0   "/bin/sh"   14 seconds ago   Exited (0) 4 seconds ago             alpine_sandbox1
$ docker exec -it "alpine_sandbox1" /bin/sh
Error response from daemon: Container 07a42e9b98acfdd61e557a477c176cac300b2ad94984fe2dfcdea22c5b1518cb is not running
$ docker start alpine_sandbox1
alpine_sandbox1
$ docker ps -a
CONTAINER ID   IMAGE                COMMAND     CREATED         STATUS                      PORTS     NAMES
07a42e9b98ac   alpine_sandbox:1.0   "/bin/sh"   2 minutes ago   Exited (0) 11 seconds ago             alpine_sandbox1
exit
```
background見たいなオプションが無かったか。

"restart" やってみても駄目。"run --interactive --tty" じゃ無ければ駄目か。

次のコマンドで最終確認。一旦2021/03/19の所は/bin/shを使って見ることにする。無くても良いか否かは明日以降確認する
```
docker run --init --interactive --tty --detach --name "alpinesandbox0319" alpine_sandbox:1.0 /bin/sh
```
コマンドに対しては何もせずに終了。

execコマンドで接続した後は先ほどと問題なし。

<span style="color: red; ">ここから先はフォルダ「ExprMemo」の中のファイルに移行します</span>
