# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## userテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | null: false |
| mail         | string  | null: false |
| password     | string  | null: false |
| name         | string  | null: false |
| name_reading | string  | null: false |
| birthday     | date    | null: false |

### Association
- has_many :items
- has_many :purchasers
- has_many :deals


## itemテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| item_image       | string     | null: false                    |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| item_category    | integer    | null: false                    |
| item_status      | integer    | null: false                    |
| delivery_fee     | integer    | null: false                    |
| shipper_area     | integer    | null: false                    |
| shipment_date    | integer    | null: false                    |
| item_price       | integer    | null: false                    |
| purchaser_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchaser
- belongs_to :deal


## purchaserテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| item_id      | references | null: false, foreign_key: true |
| postal_code  | string    | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item


## dealテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |
| deal_sum        | integer    | null: false                    |
| deal_commission | integer    | null: false                    |
| deal_profit     | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :item


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
