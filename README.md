# テーブル設計

## users テーブル

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| nickname   | string   | null: false |
| email      | string   | null: false |
| password   | string   | null: false |
| name       | string   | null: false |
| name_kana  | string   | null: false |
| birth_date | datetime | null: false |
### Association

- has_many :items        dependent: :destroy 
- has_many :credit_cards dependent: :destroy

## credit cardsテーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| number         | integer    | null: false                    |
| validated_date | datetime   | null: false                    |
| security_code  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
### Association

- be_longs_to :users

## item テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product      | string     | null: false                    |
| explanation  | text       | null: false                    |
| ctegory      | string     | null: false                    |
| condtion     | string     | null: false                    |
| price        | integer    | null: false                    |
| fee          | integer    | null: false                    |
| profit       | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

be_longs_to :users
has_one :delivery_destinations dependent: :destroy
has_one :deliverys             dependent: :destroy
has_one :images                dependent: :destroy

### deliverys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| burden        | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | string     | null: false                    |
| item          | references | null: false, foreign_key: true |

### Association

be_longs_to :items

### images

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| image     | ActiveStorage |                                |
| user      | references    | null: false, foreign_key: true |
### Association

be_longs_to :items

### delivery destinations 

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipality     | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| item             | references | null: false, foreign_key: true |

### Association

be_longs_to :items
