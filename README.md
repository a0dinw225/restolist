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
 
```bash
git clone https://github.com/a0dinw225/restolist.git
```
