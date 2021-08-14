# NyanLeave
猫のお世話を代わりの人に依頼することができるマッチングサービス<br>
**URL : http://nyanleave.com/**<br>
#### トップページ
![toppage](https://user-images.githubusercontent.com/73244861/129442630-93bd8bb6-7c3b-46bd-a3a1-557268d8f3c8.jpg)


## 背景
自宅で猫を飼っているのですが、用事で長期的に家を空ける際、その間猫のお世話ができなくなってしまうので、何か良い方法はないかと思ったことが、このサービスを作るきっかけとなりました。<br><br>
留守番させている間、もし事故が起こってしまった場合、怪我してからでは遅いので、誰かに見ててもらえれば良いなと考え、猫のお世話を依頼できるサービスを開発いたしました。


## 使用技術
### フロントエンド
・HTML/CSS<br>
・SCSS<br>
・Javascript<br>
・Bootstrap 4.1<br>
### バックエンド
・Ruby 2.6.3<br>
・Ruby on Rails 5.2.5<br>
・Rubocop<br>
### データベース
・MySQL 5.7
### ミドルウェア
・Nginx 1.15.8
### インフラ・開発環境
・Docker / Docker-compose<br>
・AWS（VPC,EC2,RDS,Route53）<br>

## ER図
![draw6](https://user-images.githubusercontent.com/73244861/129442479-9522c969-5a7d-42ea-9444-71e1e31ddd52.png)

## インフラ構成図
![名称未設定 (4)](https://user-images.githubusercontent.com/73244861/129443029-89e2ff4a-1802-4bef-8c71-bd1179286ad2.png)

## 機能一覧
⚪︎ 基本機能<br>
&emsp;・新規会員登録・ログイン・ログアウト機能（Devise）<br>
&emsp;・ゲストログイン機能<br>
&emsp;・ユーザー情報編集、削除機能<br>
&emsp;・プロフィール登録、編集機能<br>
&emsp;・画像投稿機能（Carrierwave）<br>
&emsp;・依頼一覧機能<br>
&emsp;・依頼投稿、編集、削除機能<br>
&emsp;・お気に入り機能（Ajax）<br>
&emsp;・レビュー投稿・削除機能<br>
&emsp;・チャット機能（ActionCable）<br><br>
⚪︎ その他<br>
&emsp;・依頼検索機能（Ransack）<br>
&emsp;・ページネーション機能（Kaminari）<br>
&emsp;・エラー、フラッシュメッセージのカスタマイズ（toastr）<br>
&emsp;・バリデーション
