# README

## 概要
子どもや育児に関する相談を投稿できるアプリケーションです。

### コンセプト
メイン機能は相談・質問とそれに対してコメントできる機能。
その他コンセプトは、以下です。
https://docs.google.com/spreadsheets/d/1OCb9t5VO9uaCVGzTrqz9toTfpyoNRm8-WiT_1_O1AK0/edit#gid=1847427732

### バージョン
* Ruby 2.6.3
* Rails 5.2.3

### 機能一覧

- [ ] ユーザーログイン機能
  - [ ] ユーザー登録機能（一般ユーザー、企業ユーザー、adminユーザー）
  - [ ] メールアドレス、名前、パスワードは必須
  - [ ] 相談一覧表示機能

- [ ] 相談機能
  - [ ] 相談投稿機能
  - [ ] 相談削除・編集機能
  - [ ] 相談へのカテゴリ付与機能（カテゴリ作成はadminユーザーのみ）

- [ ] 相談に対してコメント機能
  - [ ] コメントの削除・編集機能
  - [ ] コメントへのいいねを表示

- [ ] 企業情報登録
  - [ ] 企業情報編集・削除機能

- [ ] ユーザー同士のダイレクトチャット機能

### カタログ設計
https://docs.google.com/spreadsheets/d/1OCb9t5VO9uaCVGzTrqz9toTfpyoNRm8-WiT_1_O1AK0/edit#gid=1847427732

### テーブル定義
https://docs.google.com/spreadsheets/d/1OCb9t5VO9uaCVGzTrqz9toTfpyoNRm8-WiT_1_O1AK0/edit#gid=1485182585

### テーブルカラム定義
https://docs.google.com/spreadsheets/d/1OCb9t5VO9uaCVGzTrqz9toTfpyoNRm8-WiT_1_O1AK0/edit#gid=1406560059

### ER図
https://cacoo.com/diagrams/fh74VCPrxU7GIPa7/50B21

### 画面遷移図/画面ワイヤーフレーム
https://xd.adobe.com/view/d8b6b63b-dac2-403c-579c-f5d8ddbdd390-ae87/
プロトタイプのボタンにリンクをつけたので、クリックして画面遷移が可能です。

画面遷移図は、XDの画面上では、以下の状態です。こちらの方が確認に都合よろしければ、XDデータ自体をご共有します。
https://gyazo.com/1a15e627777dee6325943c40b213aee3

### 使用予定Gem
* devise
* carrierwave
* mini_magick
* cancancan