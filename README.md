# テーブル設計

## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| nickname           | string  | null: false  |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  |
| last_name          | string  | null: false  |
| first_name         | string  | null: false  |
| last_name_kana     | string  | null: false  |
| last_name_kana     | string  | null: false  |
| birth_date         | date    | null: false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| name         | string     | null: false                   |
| text         | text       | null: false                   |
| category_id  | integer    | null: false                   |
| status_id    | integer    | null: false                   |
| ship_cost_id | integer    | null: false                   |
| ship_from_id | integer    | null: false                   |
| ship_date_id | integer    | null: false                   |
| price        | integer    | null: false                   |
| user         | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association

- belongs_to :order