# テーブル設計

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| name               | string | null: false               |
| name_kana          | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :orders

## Items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    |
| content        | text       | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| price          | string     | null: false                    |
| charge         | string     | null: false                    |
| ship_from      | string     | null: false                    |
| days_required  | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## Orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| destination | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :destination

## Destinations テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| zip         | string | null: false |
| prefectures | string | null: false |
| city        | string | null: false |
| address     | string | null: false |
| building    | string |             |
| tel         | string | null: false |

### Association

- has_one :order
