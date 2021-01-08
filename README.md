# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false uniqueness: true|
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |
### Association

- has_many :items        dependent: :destroy 
- has_many :purchases       



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product          | string     | null: false                    |
| explanation      | text       | null: false                    |
| ctegory_id       | integer    | null: false                    |
| condtion_id      | integer    | null: false                    |
| burden_id        | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association

belongs_to :user
has_one :purchase



### purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
### Association

belongs_to :user
belongs_to :item
has_one :buying



### buyings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| municipality     | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

belongs_to :purchase


