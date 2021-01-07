# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_many :item        dependent: :destroy 
- has_many :buying       

## item テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product          | string     | null: false                    |
| explanation      | text       | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :buying
belongs_to_active_hash :delivery

### buying

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |
| prefectures      | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item 
belongs_to :prefectures

### deliverys

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| ctegory_id       | integer    | null: false                    |
| condtion_id      | integer    | null: false                    |
| burden_id        | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |

### Association

belongs_to_active_hash :items

## credit_cardsテーブル (active_hash)

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| number_id        | integer    | null: false                    |
| customer_id      | integer    | null: false                    |
| security_code_id | integer    | null: false                    |

### Association

- belongs_to :user