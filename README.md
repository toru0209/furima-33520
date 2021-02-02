# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false | 
| mail_address    | string  | null: false | 
| password        | string  | null: false | 
| last_name       | string  | null: false | 
| first_name      | string  | null: false | 
| last_name_kana  | string  | null: false | 
| first_name_kana | string  | null: false | 
| birthday        | date    | null: false | 

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       | 
| description    | text       | null: false       | 
| category       | string     | null: false       | 
| condition      | string     | null: false       | 
| shipping_cost  | string     | null: false       | 
| shipping_place | string     | null: false       | 
| shipping_day   | string     | null: false       | 
| price          | integer    | null: false       | 
| user_id        | references | foreign_key: true | 

<!-- imageはactiverecordにて -->

### Association

- belongs_to :users
- has_one :order

## orders テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| user_id      | references | foreign_key: true | 
| item_id      | references | foreign_key: true | 

### Association

- belongs_to :users
- belongs_to :items

## addresses テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | integer    | null: false       | 
| prefecture   | string     | null: false       | 
| city         | string     | null: false       | 
| number       | integer    | null: false       | 
| building     | string     | null: false       | 
| phone        | integer    | null: false       | 
| order_id     | references | foreign_key: true | 

### Association

- belongs_to :orders