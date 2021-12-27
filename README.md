## name(アプリケーション名)

「 RESTOLIST 」

## Overview（アプリケーションの概要）
 
行ってみたいレストランにいいねやコメントをしてユーザー間で共有するWebサービス
 
## Functions & Technology List(機能と技術一覧)

Webサービス機能一覧
* ゲストログイン機能
* 認証機能
* レストランいいね機能
* レストランにコメントを付ける機能
* レストランのコメント一覧機能
* レストランの場所を表示する地図機能
* ページネーション機能

使用した技術一覧
* AWS Cloud9
* Web API(Google Maps Javascript API)
* 一対多, 多対多の関係 
* セッション管理(Cookie)
* データベース(開発環境: MySQL, 本番環境: PostgreSQL)
* Heroku(本番環境のデプロイ)
* RSpec(テストコード)
 

## DEMO

> https://restolist.herokuapp.com/

## How to Use(利用方法)

会員登録してログインすると、レストランにいいねや取り消しができる。レストラン詳細情報や場所を示す地図を確認でき、レストランに関するコメントを投稿することができる。  
ゲストユーザーでのログインでは、レストランにいいねや取り消しができ、レストラン詳細情報や場所も地図で確認することができる。また会員登録した他ユーザーのコメントを見ることができる。  
 
## Features(Webサービスの特徴)

* 友人や恋人などと食事をする際に事前に調べることが多いがどのお店がよさそうなのか迷ってしまう。そこでユーザーがレストランにいいねしてその数を可視化することでどのレストランが人気なのか一目で見つかるWebサービスを作成した。
* ユーザーがどういったWebサービスなのか登録する前に覗きたい方が多いと考え一部機能を制限しメールアドレスなどの登録が不要でサービスが利用できるゲストログインを実装した。  
* ユーザビリティを考慮してユーザーが直感的に操作しやすい機能やUIを設計した。

## ER図

<img width="728" alt="スクリーンショット 2021-12-27 21 34 45" src="https://user-images.githubusercontent.com/93024617/147472340-807d2fec-6f9a-4642-b56d-7a9cac94b1a9.png">

## Requirement(要件)

* HTML5
* CSS3
* Bootstrap v5.0
* Ruby 3.0.0
* Ruby on Rails 6.1.3.1
 
## Installation(インストール手順)

AWS Cloud9上でのインストール手順について

rvmを最新版へとアップデート
 
```bash
rvm get latest
```

Ruby 3.0.0をインストール
 
```bash
rvm install 3.0.0
```
 
Ruby 3.0.0を利用

```bash
rvm --default use 3.0.0
```

Railsのバージョン6.1.3.1をインストール

```bash
gem install rails -v 6.1.3.1
```

Yarnのインストール  
Rails6では、node.jsというツールのパッケージマネージャーであるYarnをインストールする必要がある

```bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

```bash
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```

```bash
sudo apt update && sudo apt install yarn
```

これでRailsプロジェクトが動く

## Usage
 
クラウドでの動作方法
 

MySQLサーバーの起動

```bash
sudo service mysql start
```

起動状態確認

```bash
sudo service mysql status
```

停止

```bash
sudo service mysql stop
```


MySQLの文字化け対策

```bash
cat /etc/mysql/mysql.conf.d/mysqld.cnf | sed -e '/utf8/d' | sed -e '/sql_mode/d' | sed -e '$acharacter-set-server=utf8\nsql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' | sudo tee /etc/mysql/mysql.conf.d/mysqld.cnf
```

上記のコマンドを実行すると、下記のようなMySQLの設定が 、/etc/mysql/mysql.conf.d/mysqld.cnf ファイルの`[mysqld]`と書かれた欄に追加される。これにより、MySQLのデータベースで保存されるデータに日本語を含むことができるようになる。

```bash
character-set-server=utf8
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
```


ユーザーの追加
* ユーザ名：`dbuser`  
* パスワード：`dbpass`

(1) `sudo mysql -u root`でMySQLにログインする

(2) mysql>の表示に続けて、以下のコマンドをコピペで入力し、実行

このコマンドにより、dbuserという名前のユーザをMySQLに追加するとともに、MySQLの管理者権限（何でも実行できる権限）を付与する。
```bash
GRANT ALL PRIVILEGES ON *.* TO 'dbuser'@'localhost' IDENTIFIED BY 'dbpass' WITH GRANT OPTION;
```

(3) `exit`で一度MySQLからログアウトする

設定を反映させるためにMySQLサーバを再起動する

ターミナルで実行してMySQLサーバを再起動

```bash
sudo service mysql restart
```

文字化け対策ができているかの確認

ターミナルで実行してMySQLサーバに接続

```bash
sudo mysql -u root
```

MySQLサーバに接続して実行

```bash
mysql> show variables like "chara%";
```

上記show variablesの出力結果：

```bash
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8                       |
| character_set_connection | utf8                       |
| character_set_database   | utf8                       |
| character_set_filesystem | binary                     |
| character_set_results    | utf8                       |
| character_set_server     | utf8                       |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
```

上記のように、utf8が表示されていればOK。latin1が表示されていれば設定ファイルを作成できていないか、MySQLサーバを再起動できていないかのどちらかになる。


dbuserが追加されているか確認

```bash
mysql> SELECT Host, User FROM mysql.user WHERE User = 'dbuser';
```

出力結果：
```bash
+-----------+--------+
| Host      | User   |
+-----------+--------+
| localhost | dbuser |
+-----------+--------+
```

プロジェクトをクローンする

```bash
git clone https://github.com/a0dinw225/restolist.git
```

データベースの作成

Railsサーバを終了し、以下の1行のコマンドを実行する

```bash
rails db:create
```
出力結果：

```bash
Created database 'lestolist_development'
Created database 'lestolist_test'
```

もし、 rails db:create したときにエラーが発生した場合には、 `sudo service mysql status` でMySQLサーバが起動しているか確認。起動していなければ、 `sudo service mysql start` コマンドを実行する。

サーバを起動してデータベースの接続を確認

Railsのコマンドによってサーバーを起動する

```bash
rails s
```

Webサービスが表示されればOK