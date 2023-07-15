# 万葉課題
Dproの万葉課題と呼ばれるタスク管理アプリ。
 - CROUD機能
 - 国際化
 - 検索機能
 - ページネーション
 - ユーザー概念
 - 管理者機能
 - Bootstrapによるフロントデザイン
を実装
---

6/6追記

## Heroku デプロイ手順
 - 1.git add. , git commit -m""でファイルをコミットする
 - 2.`$ heroku create`で新しくアプリケーションを作成
 - 3.gem 'net-smtp',gem 'net-imap',  gem 'net-pop' を追記。bundle installする
 - 4.`$ git push heroku ブランチの名前:master`を実行
--- 

## 6/3時点のテーブルスキーマ

- Usersテーブル

| column name     | date type | 
| --------------- | --------- | 
| id              | string    | 
| name            | string    | 
| email           | string    | 
| password        | string    | 
| password.digest | string    | 


---

- Tasksテーブル


| column name        | date type | 
| ------------------ | --------- | 
| id                 | string    | 
| user_id            | string    | 
| substance          | string    | 
| content            | txt       | 
| period             | string    | 
| state_for_progress | string    | 

---

- Labelingsテーブル

| column name | date type | 
| ----------- | --------- | 
| id          | string    | 
| id_Tasks    | string    | 
| id_Labels   | string    | 

---

- Labelsテーブル

| column name | date type | 
| ----------- | --------- | 
| id          | string    | 
| label_name  | string    | 
