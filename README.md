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
⚪︎ 基本機能<br><br>
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
⚪︎ その他<br><br>
&emsp;・依頼検索機能（Ransack）<br>
&emsp;・ページネーション機能（Kaminari）<br>
&emsp;・エラー、フラッシュメッセージのカスタマイズ（toastr）<br>
&emsp;・バリデーション

## 工夫した点
&emsp;・カード型UIのデザインにすることで、必要な情報を最小限にまとめ、ユーザー間のミスマッチを軽減<br>
&emsp;・DM機能を実装し、コミュニケーションを手軽にできるようにした<br>
&emsp;・ヘッダーに検索フォームを置くことでどのページからでも検索することが可能<br>
&emsp;・ゲストユーザー機能によって誰でもお試しで利用可能<br>
&emsp;・実際に使ってもらうことを想定して投稿を充実させる<br>
&emsp;・チーム開発を意識し、issueやブランチ、PRを活用した開発手法

## このアプリの使い方
ゲストユーザーも用意しているので、トップページからご利用できます。
## 会員登録後の流れ
トップページから会員登録画面へ進んでください。登録後、プロフィール登録画面へ遷移します。<br><br>
<img width="1680" alt="bf987ac255904c70c9c10075d0de889f" src="https://user-images.githubusercontent.com/73244861/129446837-5167c14a-cdfc-435b-9c98-7f044c020b9a.png"><br><br>
ここでは飼っている猫の写真をアップロードしてください。<br>また、全ての項目を入力しないと、バリデーションに引っかかってしまいます。<br>
登録後はマイページに遷移します。<br><br>
![screencapture-nyanleave-profiles-new-2021-08-14-21_52_44](https://user-images.githubusercontent.com/73244861/129446916-8d24ac07-48ff-4b72-926d-f9186d5c304c.png)<br><br>
## 猫を預ける
ヘッダーの`猫を預ける`をクリックし、猫を預ける`開始日`と、依頼が完了する`終了日`を記入し、お世話してもらうために、`お世話場所`を選択します。<br>
`特徴`には、猫の好きな食べ物や、嫌がること、トイレやご飯の回数などを、細かく記載しましょう。<br><br>
![screencapture-nyanleave-posts-new-2021-08-14-22_36_08](https://user-images.githubusercontent.com/73244861/129448012-58c8605f-bb7d-4170-b272-20ce9e39b534.png)<br><br>
## 猫をお世話する
今度は自分が猫のお世話をしてみましょう。<br>
ヘッダーの`猫をお世話する`から、全ての依頼を閲覧できます。<br><br>
![f527764a-c6c1-4a3a-be11-c5e1c1353099](https://user-images.githubusercontent.com/73244861/129448161-c664f865-a5d7-44a4-a339-ff96344147eb.png)<br><br>
お世話したい猫が決まったら、依頼を選択し、詳細画面下部の`飼い主さんのマイページ`をクリックします。<br><br>
![screencapture-nyanleave-cares-2-2021-08-14-22_44_41](https://user-images.githubusercontent.com/73244861/129448321-c2b500b5-d49e-4cc0-ae28-d1d7eaae932b.png)<br><br>
`メッセージを始める`からチャットを開始し、依頼の詳しい内容や、時間などを飼い主さんと調整しましょう。<br><br>
![be5322aa-ab19-423f-b154-6422f58102ae](https://user-images.githubusercontent.com/73244861/129448528-2c513657-b2e8-4dae-a7fa-54d68860f19c.png)

