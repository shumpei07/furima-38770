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
has_many :buyers


## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| category           | references | null: false                    |
| item_condition     | references | null: false                    |
| postage_payer      | references | null: false                    |
| region             | references | null: false                    |
| preparation_day    | references | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

belongs_to :user
has_one :buyer

## buyersテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item


## shipping_addressテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefecture      | references | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

belongs_to :buyer 
t.references :user, foreign_key: true
