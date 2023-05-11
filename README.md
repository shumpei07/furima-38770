# README

## usersテーブル

| Column             | Type    | Options                           |
| ------------------ | ------- | --------------------------------- |
| nickname           | string  | null: false                       |
| email              | string  | null: false, unique: true         |
| encrypted_password | string  | null: false                       |
| family_name        | string  | null: false                       |
| first_name         | string  | null: false                       |
| family_name_kana   | string  | null: false                       |
| first_name_kana    | string  | null: false                       |
| birth_date         | date    | null: false                       |

has_many :items


## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| category        | string     | null: false                    |
| item_condition  | string     | null: false                    |
| postage_payer   | string     | null: false                    |
| shipping_origin | string     | null: false                    |
| preparation_day | integer    | null: false                    |
| price           | integer    | null: false                    |
| seller_id       | references | null: false, foreign_key: true |

belongs_to :users
has_one :buyers

## buyersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| buyer           | references | null: false, foreign_key: true |

belongs_to :items
has_one :shipping_address


## shipping_addressテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

belongs_to :buyers