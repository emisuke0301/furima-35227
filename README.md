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

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| name      | string     | null: false                   |
| text      | text       | null: false                   |
| category  | string     | null: false                   |
| status    | string     | null: false                   |
| ship_cost | integer    | null: false                   |
| ship_from | string     | null: false                   |
| ship_date | string     | null: false                   |
| price     | integer    | null: false                   |
| user_id   | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| order_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_num      | string     | null: false                    |
| exp_month     | integer    | null: false                    |
| exp_year      | integer    | null: false                    |
| security_code | string     | null: false                    |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| building      | string     |                                |
| phone_num     | string     | null: false                    |
| order_id      | references | null: false, foreign_key: true |


### Association

- belongs_to :order