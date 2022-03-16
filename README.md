# アプリケーション名
E ACTION

# アプリケーション概要
地球温暖化を防ぐための小さなアクションを促し、ユーザー同士で競争しながら、楽しんで取り組むことができる。

# URL
https://e-action-app.herokuapp.com/

# テスト用アカウント
- Basic認証パスワード：testac
- Basic認証ID：112233
- メールアドレス：test@com
- パスワード：aaa111

# 利用方法
### アクションを記録する
1. ヘッダーからユーザー新規登録を行う
2. 「アクションをきろくする」リンクから、今日やったアクションを記録することができる

### ともだち同士でアクションの数を競う
1. ヘッダーの「マイページ」リンクから、ともだちの中でたくさんアクションを行った人を確認することができる。

# アプリケーションを作成した背景
社会的な課題であるSDGs、その中でも学生時代から興味のあった環境問題をテーマにした。<br>
環境問題は、ESD(Education for Sustainable Development)「持続可能な開発のための教育」が重要であるといわれているため、毎日の暮らしの中で考えて学び気づかせる習慣づけが大切なのではないかと考えた。<br>
そのため、主に小学生を対象として小さなアクションを積み重ねを促すようなアプリケーションを開発することにした。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1DYce0bUXpwy_-cMakNjgt0aY63RMcGSHPrRZNuTcqRY/edit#gid=982722306) 

# 実装した機能についての画像等・その説明

# 実装予定の機能
今後はログイン時のSNS認証やSNSでの共有機能を実施予定

# データベース設計
![er_image](https://user-images.githubusercontent.com/98501087/158551234-edcc9504-93cc-4bd1-8c7c-328cb06f2f7e.png)

# 画面遷移図
![screen_image](https://user-images.githubusercontent.com/98501087/158367455-38a1fbbb-1a79-4121-9866-ae0eb0abd5aa.png)

# 開発環境
- バックエンド：Ruby 3.1.1, Ruby on Rails 7.0.2<br>
- フロントエンド：JavaScript, Tailwind CSS<br>
- インフラ：<br>
- テスト：RSpec<br>
- テキストエディタ：VScode<br>
- タスク管理：GitHub<br>

# ローカルでの動作方法
以下のコマンドを順に実行。<br>
% git clone #<br>
% cd XXXXXX<br>
% bundle install<br>
% yarn install<br>

# 工夫したポイント
習慣づけをサポートするために、以下の2点を目標として開発を進めた。<br>
**① 手軽さ**1：1回あたり短時間で記録できる<br>
**② ゲーム性**：ユーザー同士で実績を競うことができる<br>