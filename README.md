# README

--- 

# 6/3時点のテーブルスキーマ

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