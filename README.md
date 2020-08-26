# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## userテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_reading  | string  | null: false |
| first_name_reading | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association
- has_many :items
- has_many :purchasers
- has_many :deals


## itemテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipper_area  | integer    | null: false                    |
| shipment_date | integer    | null: false                    |
| item_price    | integer    | null: false                    |
| purchaser_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchaser
- belongs_to :deal


## purchaserテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| item_id      | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchaser



## dealテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :purchaser


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
